#include <Arduino.h>

const int BLUE_LED = 4;
const int GREEN_LED = 5;
const int RED_LED = 6;

const int BLUE_BUTTON = 9;
const int GREEN_BUTTON = 10;
const int RED_BUTTON = 11;

void setup()
{
	// Funny number
	Serial.begin(115200);

	// Set LED's as OUTPUT's
	pinMode(BLUE_LED, OUTPUT);
	pinMode(GREEN_LED, OUTPUT);
	pinMode(RED_LED, OUTPUT);

	// Set Button's as INPUT's
	pinMode(BLUE_BUTTON, INPUT);
	pinMode(GREEN_BUTTON, INPUT);
	pinMode(RED_BUTTON, INPUT);

	// The analog pins returns random values with analogRead()
	randomSeed(analogRead(A0));
}

void loop()
{
	// Reset all LED's
	digitalWrite(BLUE_LED, LOW);
	digitalWrite(GREEN_LED, LOW);
	digitalWrite(RED_LED, LOW);

	// Small delay
	delay(random(1500, 4000));

	// Turn on random LED
	int target = random(1, 4);

	// Blue LED
	if (target == 1)
	{
		digitalWrite(BLUE_LED, HIGH);
	}

	// Green LED
	else if (target == 2)
	{
		digitalWrite(GREEN_LED, HIGH);
	}

	// Red LED
	else if (target == 3)
	{
		digitalWrite(RED_LED, HIGH);
	}

	// Start the timer
	unsigned long startTime = millis();

	bool answered = false;

	while (!answered)
	{
		// Blue button pressed
		if (digitalRead(BLUE_BUTTON) == HIGH)
		{
			if (target == 1)
			{
				Serial.print("Correct! Time: ");
				Serial.print(millis() - startTime);
				Serial.println(" ms");
			}
			else
			{
				Serial.println("Wrong Button!");
			}

			answered = true;
		}

		// Green button pressed
		else if (digitalRead(GREEN_BUTTON) == HIGH)
		{
			if (target == 2)
			{
				Serial.print("Correct! Time: ");
				Serial.print(millis() - startTime);
				Serial.println(" ms");
			}
			else
			{
				Serial.println("Wrong Button!");
			}

			answered = true;
		}

		// Red button pressed
		else if (digitalRead(RED_BUTTON) == HIGH)
		{
			if (target == 3)
			{
				Serial.print("Correct! Time: ");
				Serial.print(millis() - startTime);
				Serial.println(" ms");
			}
			else
			{
				Serial.println("Wrong Button!");
			}

			answered = true;
		}
	}

	// Turn off the LED's
	digitalWrite(BLUE_LED, LOW);
	digitalWrite(GREEN_LED, LOW);
	digitalWrite(RED_LED, LOW);

	// Delay, then play again!
	delay(random(500, 1000));
}
