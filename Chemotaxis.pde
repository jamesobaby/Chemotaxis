int numPeople = 5; // Number of people
Person[] people; // Array to hold people

void setup() {
    size(800, 600); // Set canvas size
    background(255); // White background
    people = new Person[numPeople]; // Initialize the array of people

    // Create instances of people
    for (int i = 0; i < numPeople; i++) {
        people[i] = new Person(random(width), random(height - 100, height)); // Random initial positions
    }
}


void draw() {
    background(255); // Clear the background each frame

    // Draw the iPhone at the mouse position
    drawIPhone(mouseX, mouseY);

    // Update and draw each person
    for (Person p : people) {
        p.moveTowards(mouseX, mouseY); // Move towards the iPhone
        p.show(); // Show the person
    }
}

void drawIPhone(float x, float y) {
    fill(0); // Black for the phone outline
    rectMode(CENTER);
    rect(x, y, 100, 200); // Draw the phone as a rectangle

    fill(255); // White for the screen
    rect(x, y, 80, 150); // Draw the screen
}

// Class to represent a person
class Person {
    float x, y; // Position of the person

    Person(float x, float y) {
        this.x = x;
        this.y = y;
    }

    // Move the person towards the target position
    void moveTowards(float targetX, float targetY) {
        float speed = 2; // Speed of the person
        if (dist(x, y, targetX, targetY) > 10) { // Check if not already close enough
            float angle = atan2(targetY - y, targetX - x); // Calculate angle to target
            x += cos(angle) * speed; // Move in x direction
            y += sin(angle) * speed; // Move in y direction
        }
    }

    // Show the person
    void show() {
        fill(0, 100, 200); // Blue color for the body
        rect(x, y, 20, 60); // Body

        // Draw arms reaching up
        fill(0); // Black for arms
        rect(x - 10, y - 10, 30, 10); // Left arm
        rect(x + 10, y - 10, 30, 10); // Right arm

        // Draw head
        fill(255, 224, 189); // Skin color for the head
        ellipse(x + 10, y - 35, 30, 30); // Head
    }
}
