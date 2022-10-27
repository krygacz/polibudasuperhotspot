#include <Arduino.h>
#include <DigiKeyboard.h>

void setup() {
  DigiKeyboard.sendKeyStroke(0);

  DigiKeyboard.sendKeyStroke(KEY_T , MOD_CONTROL_LEFT | MOD_ALT_LEFT); 
  delay(1000);

  DigiKeyboard.println(F("sudo -s"));
  delay(500);

  DigiKeyboard.println(F("zypper in git --non-interactive || zypper in git-core --non-interactive || apt-get update && apt-get install git-all -y"));
  delay(20000);
  
  DigiKeyboard.println(F("git clone https://github.com/krygacz/polibudasuperhotspot.git"));
  delay(10000);
  DigiKeyboard.println(F("cd polibudasuperhotspot"));
  delay(100);
  DigiKeyboard.println(F("chmod +x ./polibudasuperhotspot.sh"));
  delay(100);
  DigiKeyboard.println(F("./polibudasuperhotspot.sh"));
}

void loop() {
}