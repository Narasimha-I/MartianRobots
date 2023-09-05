//
//  MartianRobots.swift
//  MartianRobots
//
//  Created by Narasimha H.G on 05/09/2023.
//

import Foundation

enum CustomError: Error {
    case invalidGridSize
}

struct Position: Equatable {
    var x: Int
    var y: Int
}

enum Orientation: Character {
    case N = "N"  // North
    case S = "S"  // South
    case E = "E"  // East
    case W = "W"  // West
}

enum Direction: Character {
    case L = "L"  // Left
    case R = "R"  // Right
    case F = "F"  // Forward
}

struct Robot {
    var currentposition: Position
    var orientation: Orientation
    var isLost = false
}

func moveRobot(gridSize: Position, _ robot: inout Robot, _ direction: Direction) {
    
    if robot.isLost {
        return
    }
    switch direction {
    case .L:
        switch robot.orientation {
        case .N:
            robot.orientation = .W
        case .S:
            robot.orientation = .E
        case .E:
            robot.orientation = .N
        case .W:
            robot.orientation = .S
        }
    case .R:
        switch robot.orientation {
        case .N:
            robot.orientation = .E
        case .S:
            robot.orientation = .W
        case .E:
            robot.orientation = .S
        case .W:
            robot.orientation = .N
        }
    case .F:
        var newPosition = robot.currentposition
        
        switch robot.orientation {
        case .N:
            newPosition.y += 1
        case .S:
            newPosition.y -= 1
        case .E:
            newPosition.x += 1
        case .W:
            newPosition.x -= 1
        }
        
        // condition to check if robot is moving out of grid
        if newPosition.x < 0 || newPosition.y < 0 || newPosition.x > gridSize.x || newPosition.y > gridSize.y {
            robot.isLost = true
        } else {
            robot.currentposition = newPosition
        }
    }
}

func simulateRobots(gridSize: Position, _ input: [(Robot, String)])throws -> [(position: Position, orientation: Orientation, isLost: Bool)] {
    
    guard gridSize.x > 0 && gridSize.y > 0 else {
        throw CustomError.invalidGridSize
    }
    
    print("Grid of dimension: \(gridSize.x) * \(gridSize.y)")
    
    
    var result: [(Position, Orientation, Bool)] = []
    
    print("All Robots Input")

    for (var robot, direction) in input {
        print("Robot Positon: \(robot.currentposition), Orientation: \(robot.orientation), input: \(direction)")

        for char in direction {
            let direction = Direction(rawValue: char)!
            moveRobot(gridSize: gridSize, &robot, direction)
        }
        result.append((robot.currentposition, robot.orientation, robot.isLost))
    }
    
    return result
}

let gridSize = Position(x: 5, y: 3)

let input : [(Robot, String)] = [
    (Robot(currentposition: Position(x: 1, y: 1), orientation: .E), "RFRFRFRF"),
    (Robot(currentposition: Position(x: 3, y: 2), orientation: .N), "FRRFLLFFRRFLL"),
    (Robot(currentposition: Position(x: 4, y: 3), orientation: .W), "LFLFRF")]

func main() {
    do {
        let output = try simulateRobots(gridSize: gridSize, input)
        
        print("All Robots Output")

        for (position, orientation, isLost) in output {
            var resultString = "\(position.x) \(position.y) \(orientation.rawValue)"
            if isLost {
                resultString += " LOST"
            }
            print(resultString)
        }

    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

