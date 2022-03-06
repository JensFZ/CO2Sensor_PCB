#include "WiFi.h"
#include "ESPAsyncWebServer.h"
#include "MHZ19.h"
#include "SoftwareSerial.h"
#include "DHTesp.h"

//#include <NimBLEDevice.h>


#ifdef ESP8266
#include <Updater.h>
#include <ESP8266mDNS.h>
#define U_PART U_FS
#else
#include <Update.h>
#include <ESPmDNS.h>
#define U_PART U_SPIFFS
#endif

const char*     ssid =  "SSID";            // WLAN Name
const char* password =  "PASSWORT";   // WLAN Passwort




// Bluetooth Kram
/*#define SERVICE_UUID "ef635a1e-1e9d-4ecc-b07f-9c1b148084a7" // https://www.uuidgenerator.net/
static NimBLEUUID dataUuid(SERVICE_UUID);
static NimBLEAdvertising *pAdvertising = NimBLEDevice::getAdvertising();
*/

/*
   Server Index Page
*/

const char* serverUpdate =
  "<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>"
  "<form method='POST' action='#' enctype='multipart/form-data' id='upload_form'>"
  "<input type='file' name='update'>"
  "<input type='submit' value='Update'>"
  "</form>"
  "<div id='prg'>progress: 0%</div>"
  "<script>"
  "$('form').submit(function(e){"
  "e.preventDefault();"
  "var form = $('#upload_form')[0];"
  "var data = new FormData(form);"
  " $.ajax({"
  "url: '/doUpdate',"
  "type: 'POST',"
  "data: data,"
  "contentType: false,"
  "processData:false,"
  "xhr: function() {"
  "var xhr = new window.XMLHttpRequest();"
  "xhr.upload.addEventListener('progress', function(evt) {"
  "if (evt.lengthComputable) {"
  "var per = evt.loaded / evt.total;"
  "$('#prg').html('progress: ' + Math.round(per*100) + '%');"
  "}"
  "}, false);"
  "return xhr;"
  "},"
  "success:function(d, s) {"
  "console.log('success!')"
  "},"
  "error: function (a, b, c) {"
  "}"
  "});"
  "});"
  "</script>";


#define RX_PIN 33                                          // Rx pin für MHZ19 Tx pin
#define TX_PIN 32                                          // Tx Pin für MHZ19 Rx pin
#define BAUDRATE 9600                                      // MH-Z19 Serial baudrate (Default=9600)
#define dhtPin 4                                           // DHT22 Data-Pin
#define red 14
#define yellow 12
#define green 13
//#define buzzer 23

AsyncWebServer server(80);                                 // http port 80
size_t content_len;

DHTesp dht;
MHZ19 myMHZ19;                                             // Constructor für MHZ19
SoftwareSerial SerialMHZ19(RX_PIN, TX_PIN);                   // Serielle Schnittstelle für MH-Z19
const char compile_date[] = __DATE__ " " __TIME__;
uint64_t chipid;

void setup()
{
  Serial.begin(115200);                                   // Datenrate serieller Monitor

  pinMode(red, OUTPUT);
  pinMode(yellow, OUTPUT);
  pinMode(green, OUTPUT);

  digitalWrite(red, LOW);
  digitalWrite(yellow, LOW);
  digitalWrite(green, LOW);


  // Configure BUZZER functionalities.
  //ledcSetup(0, 8000, 12);
  // Attach BUZZER pin.
  //ledcAttachPin(buzzer, 0);

  chipid = ESP.getEfuseMac(); //The chip ID is essentially its MAC address(length:6bytes)
  Serial.printf("ESP32 Chip ID = %04X", (uint16_t)(chipid >> 32)); //print High 2 bytes
  Serial.printf("%08X\n", (uint32_t)chipid); //print Low 4bytes.


  dht.setup(dhtPin, DHTesp::DHT22);                       // am dhtPin ist ein DHT22 angeschlossen
  SerialMHZ19.begin(BAUDRATE);                               // (Uno example) device to MH-Z19 serial start
  myMHZ19.begin(SerialMHZ19);                                // *Serial(Stream) refence must be passed to library begin().

  myMHZ19.autoCalibration();                              // Turn auto calibration ON (OFF autoCalibration(false))

  while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    WiFi.disconnect();
    delay(1);
    WiFi.begin(ssid, password);
    delay(1000);
    Serial.println("Connecting to WiFi.." + String(ssid));
  }

  Serial.println(WiFi.localIP());                           // Ausgabe der IP-Adr. über seriellen Monitor

  server.onNotFound(notFound);

  //BLEInit();

  WebInit();
}

/*void BLEInit() {
  NimBLEDevice::init("CO2Sensor");
}*/

void WebInit() {
  // Root
  server.on("/", HTTP_GET, [](AsyncWebServerRequest * request) {
    request->send(200, "text/plain", "CO2 Sensor");
  });

  server.on("/dash", HTTP_GET, [](AsyncWebServerRequest * request) {
    String message = "";
message += "<html>";
message += "    <head>";
message += "      <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>";
message += "    <script>";
message += "    function check_values() {";
message += "      $.ajax({";
message += "        type: 'GET',";
message += "        url: '/api',";
message += "        success: function (data) {";
message += "          console.log(data);";
message += "        }";
message += "      });";
message += "    }";
message += "    setTimeout(check_values, 5000);";
message += "    </script>";
message += "    </head>";
message += "        <body>";
message += "          <canvas data-type='radial-gauge'";
message += "            data-width='300'";
message += "            data-height='300'";
message += "            data-units='ppm'";
message += "            data-min-value='0'";
message += "            data-start-angle='45'";
message += "            data-ticks-angle='260'";
message += "            data-value-box='true'";
message += "            data-max-value='5000'";
message += "            data-major-ticks='0,500,1000,1500,2000,2500,3000,3500,4000,4500,5000'";
message += "            data-minor-ticks='2'";
message += "            data-stroke-ticks='true'";
message += "            data-highlights='[";
message += "                {'from': 160, 'to': 220, 'color': 'rgba(200, 50, 50, .75)'}";
message += "            ]'";
message += "            data-color-plate='#fff'";
message += "            data-border-shadow-width='0'";
message += "            data-borders='false'";
message += "            data-needle-type='arrow'";
message += "            data-needle-width='2'";
message += "            data-needle-circle-size='7'";
message += "            data-needle-circle-outer='true'";
message += "            data-needle-circle-inner='false'";
message += "            data-animation-duration='1500'";
message += "            data-animation-rule='linear'";
message += "          ></canvas>";
    message += "";
message += "          <canvas data-type='radial-gauge'";
message += "            data-width='300'";
message += "            data-height='300'";
message += "            data-units='%'";
message += "            data-min-value='0'";
message += "            data-start-angle='45'";
message += "            data-ticks-angle='260'";
message += "            data-value-box='true'";
message += "            data-max-value='100'";
message += "            data-major-ticks='0,10,20,30,40,50,60,70,80,90,100'";
message += "            data-minor-ticks='2'";
message += "            data-stroke-ticks='true'";
message += "            data-highlights='[";
message += "                {'from': 160, 'to': 220, 'color': 'rgba(200, 50, 50, .75)'}";
message += "            ]'";
message += "            data-color-plate='#fff'";
message += "            data-border-shadow-width='0'";
message += "            data-borders='false'";
message += "            data-needle-type='arrow'";
message += "            data-needle-width='2'";
message += "            data-needle-circle-size='7'";
message += "            data-needle-circle-outer='true'";
message += "            data-needle-circle-inner='false'";
message += "            data-animation-duration='1500'";
message += "            data-animation-rule='linear'";
message += "            data-value='0'";
message += "          ></canvas>";
message += "";
message += "    <canvas data-type='linear-gauge'";
message += "        data-width='120'";
message += "        data-height='400'";
message += "        data-units='C'";
message += "        data-min-value='0'";
message += "        data-start-angle='90'";
message += "        data-ticks-angle='180'";
message += "        data-value-box='true'";
message += "        data-max-value='60'";
message += "        data-major-ticks='0,20,40,60'";
message += "        data-minor-ticks='2'";
message += "        data-stroke-ticks='true'";
message += "        data-highlights='[ {'from': 100, 'to': 220, 'color': 'rgba(200, 50, 50, .75)'} ]'";
message += "        data-color-plate='#fff'";
message += "        data-border-shadow-width='0'";
message += "        data-borders='false'";
message += "        data-needle-type='arrow'";
message += "        data-needle-width='2'";
message += "        data-needle-circle-size='7'";
message += "        data-needle-circle-outer='true'";
message += "        data-needle-circle-inner='false'";
message += "        data-animation-duration='1500'";
message += "        data-animation-rule='linear'";
message += "        data-bar-width='10'";
message += "        data-value='0'";
message += "    ></canvas>";
message += "";
message += "        <script src='http://rawgit.com/Mikhus/canvas-gauges/master/gauge.min.js'></script></body>";

        
      
    request->send(200, "text/html", message);
  });

  //temperature Route
  server.on("/temperature", HTTP_GET, [](AsyncWebServerRequest * request) {
    float temperature = dht.getTemperature();
    request->send(200, "text/plain", String(temperature) + " C");
  });

  //humidity Route
  server.on("/humidity", HTTP_GET, [](AsyncWebServerRequest * request) {
    float humidity = dht.getHumidity();
    request->send(200, "text/plain", String(humidity) + " %");
  });

  //co2 Route
  server.on("/co2", HTTP_GET, [](AsyncWebServerRequest * request) {
    int co2 = myMHZ19.getCO2();
    request->send(200, "text/plain", String(co2) + " ppm");
  });

  //API Route
  server.on("/api", HTTP_GET, [](AsyncWebServerRequest * request) {
    float temperature = dht.getTemperature();
    float humidity = dht.getHumidity();
    int co2 = myMHZ19.getCO2();
    request->send(200, "application/json", "{\"temperature\":{\"value\":" + String(temperature) + ",\"unit\":\"°C\"},\"humidity\":{\"value\":" + String(humidity) + ",\"unit\":\"%\"},\"co2\":{\"value\":" + String(co2) + ",\"unit\":\"ppm\"}}");
  });

  // Version Route
  server.on("/version", HTTP_GET, [](AsyncWebServerRequest * request) {
    request->send(200, "text/plain", String(compile_date));
  });

  // Update
  server.on("/update", HTTP_GET, [](AsyncWebServerRequest * request) {
    handleUpdate(request);
  });

  // Führt das Update aus
  server.on("/doUpdate", HTTP_POST,
  [](AsyncWebServerRequest * request) {},
  [](AsyncWebServerRequest * request, const String & filename, size_t index, uint8_t *data, size_t len, bool final) {
    handleDoUpdate(request, filename, index, data, len, final);
  });

  // Start des Servers
  server.begin();

#ifdef ESP32
  Update.onProgress(printProgress);
#endif
}

void notFound(AsyncWebServerRequest *request) {
  request->send(404, "application/json", "{\"message\":\"Not found\"}");
}

void handleUpdate(AsyncWebServerRequest *request) {
  request->send(200, "text/html", serverUpdate);
}

void handleDoUpdate(AsyncWebServerRequest *request, const String& filename, size_t index, uint8_t *data, size_t len, bool final) {
  if (!index) {
    Serial.println("Update");

    content_len = request->contentLength();

    // if filename includes spiffs, update the spiffs partition
    int cmd = (filename.indexOf("spiffs") > -1) ? U_PART : U_FLASH;
#ifdef ESP8266
    Update.runAsync(true);
    if (!Update.begin(content_len, cmd)) {
#else
    if (!Update.begin(UPDATE_SIZE_UNKNOWN, cmd)) {
#endif
      Update.printError(Serial);
    }
  }

  if (Update.write(data, len) != len) {
    Update.printError(Serial);
#ifdef ESP8266
  } else {
    Serial.printf("Progress: %d%%\n", (Update.progress() * 100) / Update.size());
#endif
  }

  if (final) {
    AsyncWebServerResponse *response = request->beginResponse(302, "text/plain", "Please wait while the device reboots");
    response->addHeader("Refresh", "20");
    response->addHeader("Location", "/");
    request->send(response);
    if (!Update.end(true)) {
      Update.printError(Serial);
    } else {
      Serial.println("Update complete");
      Serial.flush();
      ESP.restart();
    }
  }
}

void handleRoot(AsyncWebServerRequest *request) {
  request->redirect("/update");
}

void printProgress(size_t prg, size_t sz) {
  Serial.printf("Progress: %d%%\n", (prg * 100) / content_len);
}

unsigned long getDataTimer = 0;
void loop()
{
  if (millis() - getDataTimer >= 2000)
  {
    float temperature = dht.getTemperature();
    float humidity = dht.getHumidity();
    Serial.print("Temperatur: ");
    Serial.print(temperature);
    Serial.print(" °C  Feuchtigkeit: ");
    Serial.println(humidity);
    int  CO2 = myMHZ19.getCO2();                             // Request CO2 (as ppm)
    Serial.print("CO2 (ppm): ");
    Serial.print(CO2);

    digitalWrite(red, LOW);
    digitalWrite(yellow, LOW);
    digitalWrite(green, LOW);

    if (CO2 > 1500) {
      digitalWrite(red, HIGH);
      //ledcWriteTone(0, 800);
    }
    else if (CO2 > 1000) {
      digitalWrite(yellow, HIGH);
    }
    else {
      digitalWrite(green, HIGH);
    }
    
    int8_t Temp = myMHZ19.getTemperature();                 // Request Temperature (as Celsius)
    Serial.print("  Temperatur CO2Sens (°C): ");
    Serial.println(Temp);

    //SerialBT.write(CO2);

    /*pAdvertising->stop();
    pAdvertising->setServiceData(dataUuid, std::string((char*)&CO2, sizeof(CO2)));
    pAdvertising->start();*/

    getDataTimer = millis();
  }

}
