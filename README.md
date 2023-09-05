# MartianRobots
Martian Robots Simulator: Simulate robot movements on Mars. Define configurations, instructions, and grid boundaries. Get final positions and track lost robots. 

Martian Robots iOS App is a simple iOS application that allows you to explore the world of Martian Robots. It's a fun project that demonstrates how robots navigate on the surface of Mars, following instructions from Earth.

Table of Contents

Introduction
Features
Getting Started
Prerequisites
Installation
Usage
Unit Tests
Contributing


Introduction
The Martian Robots iOS App is based on a classic problem in computer science. It models the surface of Mars as a rectangular grid on which robots move according to instructions provided from Earth. Each robot has a position, orientation, and a set of instructions (e.g., move forward, turn left, turn right).

The app demonstrates how to simulate the movements of these robots and reports their final positions on Mars. If a robot goes "off" the grid, it's considered lost and leaves a "scent" to prevent future robots from falling off at the same location.

Features

Simulate the movements of Martian Robots.
Report the final positions and orientations of robots.
Handle scenarios where robots get lost.
Includes unit tests for robust code validation.
Getting Started
Prerequisites
Before you begin, ensure you have met the following requirements:

Xcode installed on your macOS machine.
A basic understanding of Swift programming.
Installation
To get started with the Martian Robots iOS App:

Clone the repository:

bash
Copy code
git clone https://github.com/Narasimha-I/MartianRobots.git
Open the Xcode project file (MartianRobots.xcodeproj) in Xcode.

Build and run the app on the iOS Simulator or a physical iOS device.

Usage

View the results on the console to see how the robots move and their final positions.
Unit Tests
This project includes a suite of unit tests to ensure the correctness of the simulation logic. You can run these tests within Xcode to validate the behavior of the code.

To run unit tests:

Open the Xcode project.

Select the "Product" menu.

Choose "Test."

The test results will be displayed in Xcode's test navigator.

Contributing
Contributions are welcome! Feel free to open issues or submit pull requests to improve the project. If you're new to contributing to open source, you can start by tackling beginner-friendly issues.





