#include <Arduino.h>
#include <Wire.h>  // Library untuk komunikasi I2C
#include <LiquidCrystal_I2C.h>
#include <DHT.h>

#define DHTPIN D7        // Pin DHT
#define DHTTYPE DHT22    // Tipe sensor DHT (DHT22)
#define RELAY_PIN D4     // Pin untuk relay channel yang digunakan

#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>

//Provide the token generation process info.
#include <addons/TokenHelper.h>

//Provide the RTDB payload printing info and other helper functions.
#include <addons/RTDBHelper.h>

#define API_KEY "AIzaSyAVFLG6dpTkzjhVH-LXaBt_gJXBYHyqiEs"
#define USER_EMAIL "hanifardiansyah002@gmail.com"
#define USER_PASSWORD "nniippooii002"
#define DATABASE_URL "https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app/"
#define DATABASE_SECRET "poianapRR7iB1dN9MSkaCruWEkxqXoxUuxU8cpdy"

const char* ssid = "kostivon";
const char* password = "askaivon";
const char* databaseURL = "https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app/";


/* Define the Firebase Data object */
FirebaseData fbdo;

/* Define the FirebaseAuth data for authentication data */
FirebaseAuth auth;

/* Define the FirebaseConfig data for config data */
FirebaseConfig config;

DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 16, 2); // Inisialisasi objek LCD dengan alamat I2C 0x27, 16 kolom, dan 2 baris

// Batas atas dan bawah suhu untuk otomatisasi relay
float upperThreshold = 30.0; // Batas atas suhu dalam derajat Celsius
float lowerThreshold = 20.0; // Batas bawah suhu dalam derajat Celsius

void setup() {
  Serial.begin(115200);  // Inisialisasi Serial Monitor

  // Koneksi WiFi ke jaringan
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  // Tunggu koneksi WiFi terhubung
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  // Print informasi jaringan WiFi yang terhubung
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);
  config.api_key = "AIzaSyAVFLG6dpTkzjhVH-LXaBt_gJXBYHyqiEs";
  auth.user.email = "hanifardiansyah002@gmail.com";
  auth.user.password = "nniippooii002";
  config.database_url = "https://sporebase-4a15a-default-rtdb.asia-southeast1.firebasedatabase.app/";

  Firebase.reconnectWiFi(true);
  fbdo.setResponseSize(4096);

  String base_path = "/";
  config.token_status_callback = tokenStatusCallback;

  config.max_token_generation_retry = 5;

  Firebase.begin(&config, &auth);
  String var = "$userId";
  String val = "($userId === auth.uid && auth.token.premium_account === true && auth.token.admin === true)";
  Firebase.RTDB.setReadWriteRules(&fbdo, base_path.c_str(), var.c_str(), val.c_str(), val.c_str(), DATABASE_SECRET);

  dht.begin();           // Inisialisasi sensor DHT
  
  // Inisialisasi pin untuk relay sebagai OUTPUT
  pinMode(RELAY_PIN, OUTPUT);
}


void loop() {
  delay(2000); // Delay 2 detik antara pembacaan sensor
  
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature(); // Baca suhu dalam derajat Celsius
  
  // Jika gagal membaca suhu atau kelembaban, tampilkan pesan error di Serial Monitor
  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("Error reading DHT!");
    return;
  }
  
  // Tampilkan suhu dan kelembaban pada Serial Monitor
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" C");

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.println(" %");
  
  // Otomatisasi relay berdasarkan suhu
  if (temperature >= upperThreshold) {
    digitalWrite(RELAY_PIN, LOW);   // Matikan relay jika suhu melebihi batas atas
    Serial.println("Relay Status: OFF (Temperature exceeded upper threshold)");
  } else if (temperature <= lowerThreshold) {
    digitalWrite(RELAY_PIN, HIGH);  // Aktifkan relay jika suhu turun di bawah batas bawah
    Serial.println("Relay Status: ON (Temperature below lower threshold)");
  }
  
  // Tampilkan suhu dan kelembaban pada LCD
  lcd.clear(); // Hapus teks sebelumnya
  lcd.setCursor(0, 0);  // Set kursor ke baris pertama, kolom pertama
  lcd.print("Temperature: ");  // Tampilkan teks untuk suhu
  lcd.print(temperature); // Tampilkan nilai suhu
  lcd.print(" C");        // Tampilkan satuan Celsius

  lcd.setCursor(0, 1);  // Set kursor ke baris kedua, kolom pertama
  lcd.print("Humidity: ");     // Tampilkan teks untuk kelembaban
  lcd.print(humidity);    // Tampilkan nilai kelembaban
  lcd.print(" %");        // Tampilkan satuan persen
  
  // Jika terhubung ke WiFi, kirim data ke Firebase
  if (WiFi.status() == WL_CONNECTED  && Firebase.ready()) {
    String timestamp = String(millis());

    // Masukkan data suhu ke dalam path /temperature/timestamp
    Firebase.RTDB.setFloat(&fbdo, "/temperature/" + timestamp, temperature);

    // Masukkan data kelembaban ke dalam path /humidity/timestamp
    Firebase.RTDB.setFloat(&fbdo, "/humidity/" + timestamp, humidity);

    Serial.println("Data sent to Firebase");
  }
}
