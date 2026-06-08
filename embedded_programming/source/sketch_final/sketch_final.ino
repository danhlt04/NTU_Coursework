#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_PN532.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

const char* WIFI_SSID     = ""; // nhap ten wifi
const char* WIFI_PASSWORD = ""; // nhap mat khau wifi
const char* API_URL       = "http://./api/attendance/checkin"; // nhap dia chi ipv4 may dang chay api va cong ket noi cua may. vi du: 132.120.1.54:5200

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

#define PN532_SCK  14
#define PN532_MISO 12
#define PN532_MOSI 13
#define PN532_SS   15

#define BUZZER_PIN 17

void beepSuccess() {
  for (int i = 0; i < 2; i++) {
    tone(BUZZER_PIN, 1000, 120);
    delay(200);
  }
}

void beepAlready() {
  tone(BUZZER_PIN, 600, 500);
  delay(600);
}

void beepError() {
  for (int i = 0; i < 3; i++) {
    tone(BUZZER_PIN, 400, 80);
    delay(150);
  }
} 

Adafruit_PN532 nfc(PN532_SS);

void showMessage(String line1, String line2 = "", String line3 = "") {
  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);
  display.setTextSize(1);

  display.setCursor(0, 0);
  display.println(line1);

  if (line2 != "") {
    display.setCursor(0, 20);
    display.println(line2);
  }

  if (line3 != "") {
    display.setCursor(0, 35);
    display.println(line3);
  }

  display.display();
}

void connectWiFi() {
  showMessage("DANG KET NOI WIFI...", WIFI_SSID);

  Serial.print("DANG KET NOI WIFI");

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  int retry = 0;
  while (WiFi.status() != WL_CONNECTED && retry < 20) {
    delay(500);
    Serial.print(".");
    retry++;
  }

  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("\nWIFI DA DUOC KET NOI!");
    Serial.print("IP: ");
    Serial.println(WiFi.localIP());

    showMessage(
      "KET NOI WIFI", 
      "THANH CONG!",
      WiFi.localIP().toString()
    );

    delay(2000);
  } else {
    Serial.println("\nKET NOI WIFI THAT BAI!");

    showMessage(
      "KET NOI WIFI", 
      "THAT BAI!",
      "KIEM TRA LAI WIFI"
    );

    delay(3000);
  }
}

void callCheckIn(String uid) {
  if (WiFi.status() != WL_CONNECTED) {
    connectWiFi();
  }

  showMessage("DANG KIEM TRA...");

  uid.replace(" ", "");
  String body = "{\"uid\":\"" + uid + "\"}";

  WiFiClient client;
  HTTPClient http;

  http.begin(client, API_URL);
  http.addHeader("Content-Type", "application/json");
  http.setTimeout(10000);

  int httpCode = http.POST(body);
  Serial.println("HTTP Code: " + String(httpCode));

  if (httpCode == 200) {
    String response = http.getString();
    StaticJsonDocument<256> doc;
    deserializeJson(doc, response);

    String name = doc["studentName"].as<String>();
    String code = doc["studentCode"].as<String>();
    String cls  = doc["className"].as<String>();

    Serial.println(name + "DA DIEM DANH");

    showMessage(
      "DIEM DANH THANH CONG!",
code + " " + cls,
      name
    );

    beepSuccess();

  } else if (httpCode == 409) {
    String response = http.getString();
    StaticJsonDocument<256> doc;
    deserializeJson(doc, response);

    String name = doc["studentName"].as<String>();

    Serial.println("NAME: " + name);

    showMessage(
      "DA DIEM DANH!",
      name,
      "HOM NAY ROI!"
    );

    beepAlready();

  } else if (httpCode == 404) {
    Serial.println("KHONG TIM THAY: " + uid);

    showMessage(
      "KHONG HOP LE!",
      "THE CHUA DUOC",
      "DANG KI!"
    );

    beepError();

  } else {
    Serial.println("LOI: " + String(httpCode));

    showMessage(
      "LOI KET NOI!",
      "THU LAI SAU"
    );
  }

  http.end();

  delay(3000);

  showMessage(
    "SAN SANG...",
    "QUET THE DE",
    "DIEM DANH"
  );

  beepError();
}

void setup() {

  Serial.begin(115200);

  Wire.begin(21, 22);

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("OLED LOI");
    while (1);
  }

  showMessage("KHOI DONG...");
  delay(1000);

  SPI.begin(
    PN532_SCK,
    PN532_MISO,
    PN532_MOSI,
    PN532_SS
  );

  nfc.begin();

  uint32_t versiondata = nfc.getFirmwareVersion();

  if (!versiondata) {
    Serial.println("KHONG TIM THAY PN532!");

    showMessage(
      "LOI PN532!",
      "KIEM TRA DAY NOI"
    );

    while (1);
  }

  Serial.println("PN532 OK");

  nfc.SAMConfig();

  showMessage("PN532 OK");
  delay(1000);

  connectWiFi();

  showMessage(
    "San sang...",
    "QUET THE DE",
    "DIEM DANH"
  );
}

void loop() {

  uint8_t uid[7];
  uint8_t uidLength;

  bool success = nfc.readPassiveTargetID(
    PN532_MIFARE_ISO14443A,
    uid,
    &uidLength
  );

  if (success) {

    String uidStr = "";

    for (uint8_t i = 0; i < uidLength; i++) {

      if (uid[i] < 0x10)
        uidStr += "0";

      uidStr += String(uid[i], HEX);
    }

    uidStr.toLowerCase();

    Serial.print("UID: ");
    Serial.println(uidStr);

    callCheckIn(uidStr);

    delay(2000);
  }
}