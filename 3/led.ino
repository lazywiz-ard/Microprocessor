//
// C Code for Blinking LED
//
extern "C" {
    void start();
    void led(byte);
}

void setup() {
    start(); // Initialize the LED pin
}

void loop() {
    led(1); // Turn the LED ON
    led(0); // Turn the LED OFF
}
