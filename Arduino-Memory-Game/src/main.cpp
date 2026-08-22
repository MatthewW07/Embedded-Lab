
#include <Arduino.h>


// -------- -------- --------
// Pin configuration
// -------- -------- --------

constexpr byte LED_COUNT = 4;
constexpr byte MAX_LEVEL = 64;

constexpr byte LED_PINS[LED_COUNT] = {
  3, // Red
  4, // Green
  5, // Blue
  6  // Yellow
};

constexpr byte BUTTON_PINS[LED_COUNT] = {
  9,  // Red
  10, // Green
  11, // Blue
  12  // Yellow
};

constexpr unsigned long LED_ON_TIME = 250;
constexpr unsigned long LED_OFF_TIME = 250;
constexpr unsigned long LEVEL_DELAY = 1500;\



// -------- -------- --------
// Helper functions
// -------- -------- --------

// Flash the sequence of lights
void playSequence(const byte sequence[], byte length) {
  for (byte i = 0; i < length; ++i) {
    const byte target = sequence[i];

    // Flash ON
    digitalWrite(LED_PINS[target], HIGH);
    delay(LED_ON_TIME);

    // Flash OFF
    digitalWrite(LED_PINS[target], LOW);
    delay(LED_OFF_TIME);
  }
}

// Detect when a button is pressed
int detectButtonPress() {
  while (true) {
    for (byte i = 0; i < LED_COUNT; ++i) {
      // See if button is pressed
      if (digitalRead(BUTTON_PINS[i]) == HIGH) {
        // Debounce?
        delay(20);

        // Confirm button is still pressed
        if (digitalRead(BUTTON_PINS[i]) == HIGH) {
          // Wait for button release
          while (digitalRead(BUTTON_PINS[i]) == HIGH) {
            delay(1);
          }

          return i;
        }
      }
    }
  }
}

// Check if sequences are equal
bool checkSequences(const byte seq1[], const byte seq2[], byte length) {
  for (byte i = 0; i < length; ++i) {
    if (seq1[i] != seq2[i]) {
      return false;
    }
  }

  return true;
}



// -------- -------- --------
// Setup 
// -------- -------- --------

byte trueSequence[MAX_LEVEL];
byte level = 1;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);

  // Setup inputs and outputs
  for (byte i = 0; i < LED_COUNT; ++i) {
    pinMode(LED_PINS[i], OUTPUT);
    pinMode(BUTTON_PINS[i], INPUT);
    digitalWrite(LED_PINS[i], LOW);
  }

  // Random analog seed
  randomSeed(analogRead(A0));

  Serial.println("Welcome to the Memory Game!");
  Serial.println("See how far you can go!");
  Serial.println();
}



// -------- -------- --------
// Main loop
// -------- -------- --------

void loop() {
  Serial.println();
  Serial.print("Level ");
  Serial.println(level);

  delay(LEVEL_DELAY);

  byte trueSequence[MAX_LEVEL];
  byte userSequence[MAX_LEVEL];

  // Generate the next sequence value
  trueSequence[level - 1] = random(LED_COUNT);

  // Flash the sequence
  playSequence(trueSequence, level);

  // Get the user sequence
  for (byte i = 0; i < level; ++i) {
    userSequence[i] = detectButtonPress();
  }

  // Check if the user passed
  if (checkSequences(trueSequence, userSequence, level)) {
    Serial.print("Correct! You passed level ");
    Serial.println(level);

    // See if they beat the game
    if (level == MAX_LEVEL) {
      Serial.println("Congratulations! You beat the game!");
      Serial.println("Press any button to play again!");

      level = 1;
      detectButtonPress();
    } else {
      ++level;
    }
  } else {
    Serial.println("You lose! Loser! That's you! You're a loser!");
    Serial.println("Press any button to play again!");
    
    level = 1;
    detectButtonPress();
  }
}
