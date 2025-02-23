#include "TrackJet.h"
#include "Wire.h"
#include "Preferences.h"

#include "VL53L0X.h"
#include "MPU6050_light.h"

#include "DisplayCharactersSet.h"
#include "WiFiCaptain.h"
#include "SemiIntelligentServo.h"

SerialPWM TJ::serialPWM(TJ::REG_DAT, TJ::REG_LATCH, TJ::REG_CLK, TJ::REG_OE, TJ::PWM_FREQUENCY);
QuadEncoder TJ::quadEnc(TJ::ENC_A, TJ::ENC_B, TJ::ENC_SW);
SemiIntelligentServo TJ::servo[] = {SemiIntelligentServo(TJ::SERVO[0], SERVO_CHANNEL[0]),
                                    SemiIntelligentServo(TJ::SERVO[1], SERVO_CHANNEL[1]), 
                                    SemiIntelligentServo(TJ::SERVO[2], SERVO_CHANNEL[2])};
MPU6050 TJ::mpu(Wire);
VL53L0X TJ::lidar;

unsigned long updatePWM_handleMelody_prevMillis = 0;

void TJ::updatePWM(void * param) {
    for(;;) {
        TrackJet.updateAnalogMux();
        serialPWM.update();

        TrackJet.checkConnection();
        TrackJet.motorsUpdateSpeed();
        TrackJet.displayText();

        for(uint8_t servoID = 0; servoID < SERVO_COUNT; ++servoID) {
            TJ::servo[servoID].updatePWM();
        }

        TrackJet.gyroUpdate();
        TrackJet.lidarUpdate();
        TrackJet.internCommandHandle();
        TrackJet.handleLowBatt();

        vTaskDelay(TJ::controlPeriod);
    }
}
void TJ::updateEnc(void * parameter) {
    static uint8_t prevEncState[2] = {0, 0};
    for(;;) {
        for(uint8_t encID = 0; encID < 2; ++encID) {
            uint8_t encState = encGetState(encID);

            if((encState == (prevEncState[encID] + 1)) || (encState == (prevEncState[encID] - 3))) {
                TrackJet.encSteps[encID]++;
            }
            else if((encState == (prevEncState[encID] - 1)) || (encState == (prevEncState[encID] + 3))){
                TrackJet.encSteps[encID]--;
            }
            prevEncState[encID] = encState;
        }
        TrackJet.handleMelody();
        delayMicroseconds(500);
    }
}
uint8_t TJ::encGetState(uint8_t encID) {
    bool encA = 0, encB = 0;
    if(encID == 0) {
        encA = (adc1_get_raw(TJ::ADC_CH_ENC_FL) > TrackJet.encThreshold[0]);
        encB = (adc1_get_raw(TJ::ADC_CH_ENC_RL) > TrackJet.encThreshold[1]);
    }
    else if(encID == 1) {
        encA = (adc1_get_raw(TJ::ADC_CH_ENC_FR) > TrackJet.encThreshold[2]);
        encB = (adc1_get_raw(TJ::ADC_CH_ENC_RR) > TrackJet.encThreshold[3]);
    }
    if(encA && encB) {
        return 0;
    }
    if(encA && !encB) {
        return 1;
    }
    if(!encA && !encB) {
        return 2;
    }
    if(!encA && encB) {
        return 3;
    }
    return 0;
}

void TJ::handleRot(){
    quadEnc.updatePosition();
}
void TJ::handleSW(){
    quadEnc.lastPressed = millis();
}

TrackJetClass::TrackJetClass(void) {
    for(uint8_t i = 0; i < 2; ++i) {
        motorsSpeed[i] = 0;
        //motorsSpeedFiltered[i] = 0;
    }
    for(uint8_t i = 0; i < 3; ++i) {
        gyroYPR[i] = 0;
        gyroOffsets[i] = 0;
        accelOffsets[i] = 0;
    }
    for(uint8_t i = 0; i < 4; ++i) {
        analogReadData[i] = 0;
        analogReadData[i + 4] = 0;
        encThreshold[i] = TJ::encThresholdInit;
    }
    encSteps[0] = 0;
    encSteps[1] = 0;
}

void TrackJetClass::begin() {
    beginCalled = true;
    Serial.begin(115200);
    Serial.printf("Mac address: %s\n", WiFi.macAddress().c_str());

    Wire.begin(TJ::I2C_SDA, TJ::I2C_SCL);

    if(TJ::mpu.begin() == 0) {
        gyroStatus = 1;

        preferences.begin("TrackJet", false);
        gyroOffsets[0] = preferences.getFloat("gyroOffYaw", 0);
        gyroOffsets[1] = preferences.getFloat("gyroOffPitch", 0);
        gyroOffsets[2] = preferences.getFloat("gyroOffRoll", 0);
        
        accelOffsets[0] = preferences.getFloat("accOffX", 0);
        accelOffsets[1] = preferences.getFloat("accOffY", 0);
        accelOffsets[2] = preferences.getFloat("accOffZ", 0);
        preferences.end();

        TJ::mpu.setGyroOffsets(gyroYPR[1], gyroYPR[2], gyroYPR[0]);
        TJ::mpu.setAccOffsets(accelOffsets[0], accelOffsets[1], accelOffsets[2]);
    }
    else
        Serial.printf("Gyroscope MPU6050 not connected.\n");

    preferences.begin("TrackJet", false);
    preferences.getBytes("encThres", TrackJet.encThreshold, 8);
    preferences.end();

    pinMode(TJ::LIDAR, OUTPUT);
    digitalWrite(TJ::LIDAR, 1);
    TJ::lidar.setTimeout(500);
    if (TJ::lidar.init()) {
        lidarStatus = 1;
        TJ::lidar.startContinuous(TJ::controlPeriod);
    }
    else
        Serial.printf("Lidar VL53L0X not connected.\n");

    
    display(dispWelcome);
    xTaskCreatePinnedToCore(TJ::updatePWM, "updatePWM", 10000 , (void*) 0, 1, NULL, 1);
    xTaskCreatePinnedToCore(TJ::updateEnc, "updateEnc", 10000 , (void*) 0, 1, NULL, 1);
    TJ::serialPWM.set_output(true);

    pinMode(TJ::BUTTON, INPUT_PULLUP);
    attachInterrupt(TJ::ENC_A, TJ::handleRot, CHANGE);
    attachInterrupt(TJ::ENC_B, TJ::handleRot, CHANGE);
    attachInterrupt(TJ::ENC_SW, TJ::handleSW, RISING);
    pinMode(TJ::BUZZER, OUTPUT);

    adc1_config_width(ADC_WIDTH_BIT_12);
    adc1_config_channel_atten(TJ::ADC_CH_COM, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(TJ::ADC_CH_ENC_FR, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(TJ::ADC_CH_ENC_RL, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(TJ::ADC_CH_ENC_RR, ADC_ATTEN_DB_11);
    adc1_config_channel_atten(TJ::ADC_CH_ENC_FL, ADC_ATTEN_DB_11);

    ledcSetup(TJ::BUZZER_CHANNEL, 1000, 10);
}

bool TrackJetClass::buttonRead() {
    // 0-not pressed, 1-pressed
    return !digitalRead(TJ::BUTTON);
}
uint16_t TrackJetClass::potentiometerRead() {
    return map(analogReadData[POTENTIOMETER], 0, 4095, 0, 100); 
}
bool TrackJetClass::encoderReadButton() {
    return TJ::quadEnc.getSWPressed();
}
bool TrackJetClass::encoderReadButtonPulse() {
    return TJ::quadEnc.getSW();
}
int16_t TrackJetClass::encoderRead() {
    return TJ::quadEnc.getPosition();
}
void TrackJetClass::encoderReset() {
    TJ::quadEnc.clear();
}
void TrackJetClass::motorSetSpeed(const int8_t index, int8_t speed) {
    if(index == 1 || index == 2) {
        if(speed < -100)
            speed = -100;
        else if(speed > 100)
            speed = 100;
        motorsSpeed[index - 1] = speed;
    }
    else {
        if(speed < 0)
            speed = 0;
        else if(speed > 100)
            speed = 100;

        if(index == 3)
            TJ::serialPWM.setPWM(MOT3, speed);
        if(index == 4)
            TJ::serialPWM.setPWM(MOT4, speed);
        if(index == 5)
            TJ::serialPWM.setPWM(MOT5, speed);
        if(index == 6)
            TJ::serialPWM.setPWM(MOT6, speed);
    }
    
}
void TrackJetClass::motorsUpdateSpeed() {
    if((connectionEnabled == true && connectionActive == false) || battCutoff) {
        for(uint8_t i = 0; i < 2; ++i) {
            motorsSpeed[i] = 0;
        }
    }

    // Power of step up converter when batt cutoff
    TJ::serialPWM.setPWM(STEP_EN, !battCutoff*100);   // Turn on motor step up

    // Switch PFM/PWM step up converter mode
    if(motorsSpeed[0] != 0 || motorsSpeed[1] != 0) {
        TJ::serialPWM.setPWM(STEP_MODE, 0);     // PWM mode - High power
    }
    else {
        TJ::serialPWM.setPWM(STEP_MODE, 100);   // PFM mode - Low power, high efficiency
    }

    // Filter motor speeds and turn off when connection not active
    /*for(uint8_t i = 0; i < 2; ++i) {
        motorsSpeedFiltered[i] = motorsSpeed[i] * TJ::MOTOR_SPEED_FILTER_UPDATE_COEF + motorsSpeedFiltered[i] * (1 - TJ::MOTOR_SPEED_FILTER_UPDATE_COEF);
    }*/
    
    // Left motor
    if(motorsSpeed[0] > 0) {
        TJ::serialPWM.setPWM(MOT2A, (int)motorsSpeed[0]);
        TJ::serialPWM.setPWM(MOT2B, 0);
    }
    else {
        TJ::serialPWM.setPWM(MOT2A, 0);
        TJ::serialPWM.setPWM(MOT2B, -(int)motorsSpeed[0]);
    }

    // Right motor
    if(motorsSpeed[1] > 0) {
        TJ::serialPWM.setPWM(MOT1A, 0);
        TJ::serialPWM.setPWM(MOT1B, (int)motorsSpeed[1]);
    }
    else {
        TJ::serialPWM.setPWM(MOT1A, -(int)motorsSpeed[1]);
        TJ::serialPWM.setPWM(MOT1B, 0);
    }
}

void TrackJetClass::controlMovement(const int8_t joystickX, const int8_t joystickY) {
    prevCommunicationTime = millis();
    int16_t engineLeftSpeed = 0;
    int16_t engineRightSpeed = 0;

    engineLeftSpeed = (joystickY + ((joystickY >= 0) ? 1 : -1) * joystickX);
    engineRightSpeed = (joystickY - ((joystickY >= 0) ? 1 : -1) * joystickX);

    engineLeftSpeed = constrain(engineLeftSpeed, -100, 100);
    engineRightSpeed = constrain(engineRightSpeed, -100, 100);

    motorSetSpeed(1, engineLeftSpeed);
    motorSetSpeed(2, engineRightSpeed);
}

int16_t TrackJetClass::encoderGetSteps(uint8_t encID) {
    if(encID != 1 && encID != 2)
        return 0;
    return encSteps[encID - 1];
}
float TrackJetClass::encoderGetDistance(uint8_t encID) {
    if(encID != 1 && encID != 2)
        return 0;
    return encSteps[encID - 1]*2.75;
}
float TrackJetClass::encoderGetSpeed(uint8_t encID) {
    static int16_t prevEncSteps[2] = {0,0};
    static uint32_t prevTime[2] = {0,0};
    float encSpeed = (encSteps[encID-1] - prevEncSteps[encID-1]) / ((millis() - prevTime[encID-1]) * 0.001) * 2.75; // [mm/s]
    prevTime[encID-1] = millis();
    prevEncSteps[encID-1] = encSteps[encID-1];
    return encSpeed;
}
void TrackJetClass::encoderDistReset(uint8_t encID) {
    if(encID != 1 && encID != 2)
        return;
    encSteps[encID - 1] = 0;
}

void TrackJetClass::servoSetPosition(uint8_t servoID, float position) {
    if(servoID >= 1 && servoID <= SERVO_COUNT)
        TJ::servo[servoID - 1].setPosition(position);
}
void TrackJetClass::servoSetSpeed(uint8_t servoID, float speed) {
    if(servoID >= 1 && servoID <= SERVO_COUNT)
        TJ::servo[servoID - 1].setSpeed(speed);
}
float TrackJetClass::servoGetPosition(uint8_t servoID) {
    if(servoID >= 1 && servoID <= SERVO_COUNT)
        return TJ::servo[servoID - 1].getPosition();
    else
        return 0;
}
bool TrackJetClass::servoMoving(uint8_t servoID) {
    if(servoID >= 1 && servoID <= SERVO_COUNT)
        return TJ::servo[servoID - 1].moving();
    else
        return false;
}

void TrackJetClass::soundTone(float freq) {
    ledcAttachPin(TJ::BUZZER, TJ::BUZZER_CHANNEL);
    ledcWriteTone(TJ::BUZZER_CHANNEL, freq);
}
void TrackJetClass::soundEnd() {
    ledcDetachPin(TJ::BUZZER);
}

void TrackJetClass::playMelody(const int * aMelody, const int size, const int tempo)
{
	TrackJetClass::melodyPlaying = true;
    TrackJetClass::melodyPause = true;
    TrackJetClass::melodyTempo = tempo;
    TrackJetClass::melody = aMelody;
    TrackJetClass::melodythisNote = 0;
    TrackJetClass::melodySize = size;
}

void TrackJetClass::stopMelody(){
    TrackJetClass::melodyPlaying = false;
    TrackJet.soundEnd();
}

void TrackJetClass::handleMelody(){
    if(!TrackJetClass::melodyPlaying){
        return;
    }
    int notes = TrackJetClass::melodySize / sizeof(int) / 2;
    int wholenote = ((60000 * 4) / TrackJetClass::melodyTempo);
    int divider = 0, noteDuration = 0;

    divider = TrackJetClass::melody[TrackJetClass::melodythisNote + 1];
	if (divider > 0) {
	// regular note, just proceed
	    noteDuration = (wholenote) / divider;
	} else if (divider < 0) {
	// dotted notes are represented with negative durations!!
	    noteDuration = (wholenote) / abs(divider);
	    noteDuration *= 1.5; // increases the duration in half for dotted notes
	}

    if((millis() >= TrackJetClass::melodyLastMillis+(noteDuration*0.9))&&!TrackJetClass::melodyPause){
        TrackJetClass::melodyPause=true;
        TrackJetClass::melodythisNote+=2;
        TrackJetClass::soundEnd();
        if(TrackJetClass::melodythisNote>notes*2){
            TrackJetClass::melodyPlaying = false;
            return;
        }
        TrackJetClass::melodyLastMillis = millis();
    }else if((millis() >= TrackJetClass::melodyLastMillis+(noteDuration*0.1))&&TrackJetClass::melodyPause){
        TrackJetClass::soundTone(TrackJetClass::melody[TrackJetClass::melodythisNote]);
        TrackJetClass::melodyPause=false;
        TrackJetClass::melodyLastMillis = millis();
    }




}


uint8_t TrackJetClass::gyroGetStatus() {
    return gyroStatus;
}
float TrackJetClass::gyroAngleYPR(uint8_t index) {
    float output = gyroYPR[index];
    return output;
}
void TrackJetClass::gyroCalibrate() {
    if(gyroStatus == 0)
        return;
    Serial.printf("Calibration started.\n");
    gyroStatus = 2;
    TJ::mpu.calcOffsets();
    gyroStatus = 1;
    gyroOffsets[0] = TJ::mpu.getGyroZoffset();
    gyroOffsets[1] = TJ::mpu.getGyroXoffset();
    gyroOffsets[2] = TJ::mpu.getGyroYoffset();
    accelOffsets[0] = TJ::mpu.getAccXoffset();
    accelOffsets[1] = TJ::mpu.getAccYoffset();
    accelOffsets[2] = TJ::mpu.getAccZoffset();

    preferences.begin("TrackJet", false);
    preferences.putFloat("gyroOffYaw", gyroOffsets[0]);
    preferences.putFloat("gyroOffPitch", gyroOffsets[1]);
    preferences.putFloat("gyroOffRoll", gyroOffsets[2]);
    preferences.putFloat("accOffX", accelOffsets[0]);
    preferences.putFloat("accOffY", accelOffsets[1]);
    preferences.putFloat("accOffZ", accelOffsets[2]);
    preferences.end();
}
void TrackJetClass::gyroUpdate() {
    if(gyroStatus != 1)
        return;
    TJ::mpu.update();
    gyroYPR[0] = -TJ::mpu.getAngleZ();   // yaw
    gyroYPR[1] = TJ::mpu.getAngleX();   // pitch
    gyroYPR[2] = -TJ::mpu.getAngleY();   // roll
}

void TrackJetClass::updateAnalogMux() {
    static uint8_t analogReadIndex = 0;
    analogReadData[analogReadIndex] = adc1_get_raw(TJ::ADC_CH_COM);
    if(analogReadIndex == BAT_VOLT) {
        float newVoltage = battVolt();
        battVoltageFiltered = (1 - TJ::BATT_VOLTAGE_UPDATE_COEF)*battVoltageFiltered + TJ::BATT_VOLTAGE_UPDATE_COEF*newVoltage;

    }
    if(++analogReadIndex >= 8) {
        analogReadIndex = 0;
    }

    // Set analog mux for next ADC reading
    TJ::serialPWM.setPWM(MUXA, uint8_t(((analogReadIndex >> 0) & 0x01)*100));
    TJ::serialPWM.setPWM(MUXB, uint8_t(((analogReadIndex >> 1) & 0x01)*100));
    TJ::serialPWM.setPWM(MUXC, uint8_t(((analogReadIndex >> 2) & 0x01)*100));
}

float TrackJetClass::battVolt() {
    return float(analogReadData[BAT_VOLT])/4095*4/3*3.3;
}
float TrackJetClass::battPercentCalc(float voltage) {
    float percent = -546 + 153.8*voltage;; // Linear between 3.55~0% and 4.2~100%
    if(percent < 0)
        percent = 0;
    else if(percent > 100)
        percent = 100;
    return percent;
}
uint8_t TrackJetClass::battPercent() {
    return uint8_t(battPercentCalc(battVoltageFiltered) + 0.5);  // Add 0.5 to round correctly
}
void TrackJetClass::handleLowBatt() {
    static bool prevBattCutoff = false;
    if(battVoltageFiltered < TJ::BATT_VOLTAGE_CUTOFF)
        battCutoff = true;
    else if(battVoltageFiltered > TJ::BATT_VOLTAGE_RESET)
        battCutoff = false;

    if(battCutoff && !prevBattCutoff) {
        soundTone(1000);
        displayText("LOW BATT");
    }
    else if(!battCutoff && prevBattCutoff) {
        soundEnd();
    }
    if(battCutoff && !displayIsBusy()) {
        soundTone(1000);
        displayText("LOW BATT");
    }

    prevBattCutoff = battCutoff;
}

uint16_t TrackJetClass::lineRead(uint8_t index) {
    if(index == 1)
        return map(analogReadData[LINE_SENSOR_LEFT], 0, 4095, 0, 100); 
    else if(index == 2)
        return map(analogReadData[LINE_SENSOR_RIGHT], 0, 4095, 0, 100);
    else 
        return 0;
}

uint16_t TrackJetClass::lidarDistance() {
    return lidarDist;
}
void TrackJetClass::lidarUpdate() {
    if(lidarStatus != 1)
        return;
    lidarDist = TJ::lidar.readRangeContinuousMillimeters();
}

void TrackJetClass::ledWrite(uint8_t id, bool state) {
    if(id==1)
        TJ::serialPWM.setPWM(LED1, state*100);
    else if(id == 2)
        TJ::serialPWM.setPWM(LED2, state*100);
}
void TrackJetClass::ledWriteAnalog(uint8_t id, uint8_t brightness) {
    if(brightness > 100)
        brightness = 100;
    if(id==1)
        TJ::serialPWM.setPWM(LED1, brightness);
    else if(id == 2)
        TJ::serialPWM.setPWM(LED2, brightness);
}
void TrackJetClass::displaySingle(uint8_t row, uint8_t col, bool state) {
    TJ::serialPWM.setDispSingle(row, col, state*DISP_PWM_RESOLUTION);
}
void TrackJetClass::displaySingleAnalog(uint8_t row, uint8_t col, int8_t brightness) {
    TJ::serialPWM.setDispSingle(row, col, brightness);
}
void TrackJetClass::displayAll(int8_t value) {
    TJ::serialPWM.setDispAll(value);
}
void TrackJetClass::display(uint8_t state[][DISP_COLS]) {
    TJ::serialPWM.setDisp(state);
}
void TrackJetClass::displayDigit(const uint8_t digit) {
    if(digit > 9) {
        return;
    }
    displayChar(digit + 48);
}

void TrackJetClass::displayChar(const char letter, int8_t sweepRight, int8_t sweepDown) {
    
    uint8_t letterID = letter;
    if(letterID >= 97 && letterID <= 122) {
        letterID = letterID - 32;   // change to upper case letters
    }
    if(letterID < 40 || letterID > 90) {
        return;     // out of defined letters
    }
    letterID = letterID - 40;   // move to beginning of character set array
    for(uint8_t row = 0; row < 5; ++row) {
        for(uint8_t col = 0; col < 5; ++col) {
            if((row + sweepDown) >= 0 && (row + sweepDown) < DISP_ROWS && (col + sweepRight) >= 0 && (col + sweepRight) < DISP_COLS) {
                TJ::serialPWM.setDispSingle(row + sweepDown, col + sweepRight, DISP_PWM_RESOLUTION*characterSet[letterID][row][col]);
            }
        }
    }
}

void TrackJetClass::displayText(String text, bool sweep) {
    static uint8_t letterIndex;
    static uint32_t prevMoveTime = 0;
    static bool sweeping;
    if(text.length() > 0) {
        displayTextBuffer = text;
        letterIndex = 0;
        prevMoveTime = millis();
        sweeping = sweep;
    }
    if(prevMoveTime == 0) {
        return;
    }

    if(sweeping) {
        if((millis() > prevMoveTime + TJ::lettersSweepTimeout) && letterIndex <= (displayTextBuffer.length()*5)) {
            prevMoveTime = millis();

            uint8_t letterID1 = displayTextBuffer[letterIndex / 5];
            uint8_t letterID2 = displayTextBuffer[letterIndex / 5 + 1];

            displayAll(0);
            displayChar(letterID1, -(letterIndex % 5));
            displayChar(letterID2, (5 - (letterIndex % 5)));

            if(letterIndex / 5 >= displayTextBuffer.length()) {
                displayTextBuffer = "";
                prevMoveTime = 0;
            }
            ++letterIndex;
        }
    }
    else {
        if(millis() > prevMoveTime + TJ::lettersSwapTimeout - TJ::lettersBlankTimeout) {
            displayAll(0);
        }
        if((millis() > prevMoveTime + TJ::lettersSwapTimeout) && letterIndex <= displayTextBuffer.length()) {
            prevMoveTime = millis();

            displayAll(0);
            displayChar(displayTextBuffer[letterIndex]);

            if(letterIndex >= displayTextBuffer.length()) {
                displayTextBuffer = "";
                prevMoveTime = 0;
            }
            ++letterIndex;
        }
    }
}

bool TrackJetClass::displayIsBusy() {
    return !displayTextBuffer.isEmpty();
}

void TrackJetClass::startWiFiCaptain(String name, String password) {
    if(!beginCalled) {
        begin();
    }

    String ssid_final = "TrackJet-";
    if(name.isEmpty() || name == "<your_name>") {
        ssid_final += WiFi.macAddress();
    }
    else {
        ssid_final += name;
    }
    setApCredentials(ssid_final, password);
    wifiCaptInit();
    connectionEnabled = true;
}

void TrackJetClass::checkConnection() {
    if(!connectionEnabled) {
        return;
    }
    if(millis() > prevCommunicationTime + TJ::communicationTimeout) {
        connectionActive = false;
    }
    else {
        connectionActive = true;
    }
}

String TrackJetClass::commandGet() {
    String command = String(commandGetCaptain());
    command.toLowerCase();
    return command;
}

String TrackJetClass::commandGetIndexed(uint8_t index) {
    char commandBuffer[64];
    sprintf(commandBuffer, commandGetCaptain());
    const char delimiter[2] = " ";
    char *token;
    token = strtok((char *)commandBuffer, delimiter);
    for(uint8_t i = 0; i < index; ++i) {
        token = strtok(NULL, delimiter);
    }
    String command = String(token);
    command.toLowerCase();
    return command;
}

void TrackJetClass::commandClear() {
    commandClearCaptain();
}

void TrackJetClass::internCommandHandle() {
    static uint8_t counter = 0;
    if(counter < 20) {
        counter++;
        return;
    }
    else {
        counter = 0;
    }
    if(TrackJet.commandGetIndexed(0) == "reset" || TrackJet.commandGetIndexed(0) == "restart") {
        ESP.restart();
    }
    else if(TrackJet.commandGet() == "encoder calibrate") {
        TrackJet.encoderCalibrate(5000);    //calibrate for 5s
        TrackJet.commandClear();
    }
}

void TrackJetClass::commandSend(String type, String text) {
    commandSendCaptain(type, text);
}

void TrackJetClass::commandDisp(String text) {
    commandSend("commandDisp", text);
}

void TrackJetClass::sendStatus(){
    /*
    battery: Percent, Voltage
    lidar: Lidar Dist
    servos: S1pos, S2pos, S3pos, S1moving, S2moving, S3moving
    buttons: Button, EncPos, EncButton, Potentiometer
    line: L1read(int), L2read(int)
    encoders: E1spd, E2spd, E1dist, E2dist, E1steps, E2steps
    encoders_raw: FLraw, RLraw, FRraw, RRraw, FLthr, RLthr, FRthr, RRthr
    */
    TrackJet.commandSend("battery", String(TrackJet.battPercent())+","+String(((float)((int)(TrackJet.battVolt()*100)))/100));
    TrackJet.commandSend("lidar", String(TrackJet.lidarDistance()));
    TrackJet.commandSend("servos", String(TrackJet.servoGetPosition(1))+","+String(TrackJet.servoGetPosition(2))+","+String(TrackJet.servoGetPosition(3))+","+String(TrackJet.servoMoving(1))+","+String(TrackJet.servoMoving(2))+","+String(TrackJet.servoMoving(3)));
    TrackJet.commandSend("buttons", String(TrackJet.buttonRead())+","+String(TrackJet.encoderRead())+","+String(TrackJet.encoderReadButton())+","+String(TrackJet.potentiometerRead()));
    TrackJet.commandSend("line", String(TrackJet.lineRead(1))+","+String(TrackJet.lineRead(2)));
    TrackJet.commandSend("encoders", String(TrackJet.encoderGetSpeed(1))+","+String(TrackJet.encoderGetSpeed(2))+","+String(TrackJet.encoderGetDistance(1))+","+String(TrackJet.encoderGetDistance(2))+","+String(TrackJet.encoderGetSteps(1))+","+String(TrackJet.encoderGetSteps(2)));
    
    int encFL = (adc1_get_raw(TJ::ADC_CH_ENC_FL));
    int encRL = (adc1_get_raw(TJ::ADC_CH_ENC_RL));
    int encFR = (adc1_get_raw(TJ::ADC_CH_ENC_FR));
    int encRR = (adc1_get_raw(TJ::ADC_CH_ENC_RR));
    uint16_t thrFL = TrackJet.encThreshold[0];
    uint16_t thrRL = TrackJet.encThreshold[1];
    uint16_t thrFR = TrackJet.encThreshold[2];
    uint16_t thrRR = TrackJet.encThreshold[3];
    TrackJet.commandSend("encoders_raw", String(encFL)+","+String(encRL)+","+String(encFR)+","+String(encRR)+","+String(thrFL)+","+String(thrRL)+","+String(thrFR)+","+String(thrRR));
}

void TrackJetClass::encoderCalibrate(uint16_t duration) {
    uint32_t startTime = millis();
    uint16_t encNew[4] = {TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit};
    uint16_t encMin[4] = {TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit};
    uint16_t encMax[4] = {TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit, TJ::encThresholdInit};
    while(millis() < (startTime + duration)) {
        encNew[0] = adc1_get_raw(TJ::ADC_CH_ENC_FL);
        encNew[1] = adc1_get_raw(TJ::ADC_CH_ENC_RL);
        encNew[2] = adc1_get_raw(TJ::ADC_CH_ENC_FR);
        encNew[3] = adc1_get_raw(TJ::ADC_CH_ENC_RR);
        for(uint8_t i = 0; i < 4; ++i) {
            if(encNew[i] > encMax[i]) {
                encMax[i] = encNew[i];
            }
            else if(encNew[i] < encMin[i]) {
                encMin[i] = encNew[i];
            }
        }
        delay(1);
    }
    for(uint8_t i = 0; i < 4; ++i) {
        TrackJet.encThreshold[i] = uint16_t((encMax[i] + encMin[i])/2);
        Serial.printf("Enc%d %d\n", i, TrackJet.encThreshold[i]);
    }
    preferences.begin("TrackJet", false);
    preferences.putBytes("encThres", TrackJet.encThreshold, 8);
    preferences.end();
}

TrackJetClass TrackJet;
