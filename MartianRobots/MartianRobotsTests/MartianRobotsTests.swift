//
//  MartianRobotsTests.swift
//  MartianRobotsTests
//
//  Created by Narasimha H.G on 05/09/2023.
//

import XCTest
@testable import MartianRobots

class MartianRobotsTests: XCTestCase {

    func testInvalidGridSize() {
     
        do {
            _ = try simulateRobots(gridSize: Position(x: -1, y: 0), input)
        } catch {
            XCTAssertEqual(error as? CustomError, CustomError.invalidGridSize)
        }
    }
        
    func testMoveRobotRight() {
        var robot = Robot(currentposition: Position(x: 0, y: 0), orientation: .N)
        moveRobot(gridSize: Position(x: 5, y: 3), &robot, .R)
        XCTAssertEqual(robot.orientation, .E)
    }
    
    func testMoveRobotForward() {
        var robot = Robot(currentposition: Position(x: 1, y: 1), orientation: .N)
        moveRobot(gridSize: Position(x: 5, y: 3), &robot, .F)
        XCTAssertEqual(robot.currentposition, Position(x: 1, y: 2))
    }
    
    func testMoveRobotOutOfBounds() {
        var robot = Robot(currentposition: Position(x: 5, y: 3), orientation: .E)
        moveRobot(gridSize: Position(x: 5, y: 3), &robot, .F)
        XCTAssertTrue(robot.isLost)
    }
    
    func testScent_WhenFirstRobotMoveOutOfBound_secondRobotDoesNotMoveOutOfBound() {
        let input : [(Robot, String)] = [
            (Robot(currentposition: Position(x: 3, y: 2), orientation: .N), "FRRFLLFFRRFLL"),
            (Robot(currentposition: Position(x: 4, y: 3), orientation: .W), "LFLFRF")]
        
        let output = try? simulateRobots(gridSize: Position(x: 5, y: 3), input)
        
        XCTAssertEqual(output?.count, 2)
        
    
        // First Robot position and Orientation

        XCTAssertEqual(output?[0].position, Position(x: 3, y: 3))
        XCTAssertEqual(output?[0].orientation, .N)
        
        // is first robot lost
        XCTAssertEqual(output?[0].isLost, true)
        
        // Second Robot position and Orientation

        XCTAssertEqual(output?[1].position, Position(x: 5, y: 1))
        XCTAssertEqual(output?[1].orientation, .S)
        
        // is 3rd robot lost
        XCTAssertEqual(output?[1].isLost, false)
    }
    
    func testSimulateRobots() {
        let input : [(Robot, String)] = [
            (Robot(currentposition: Position(x: 1, y: 1), orientation: .E), "RFRFRFRF"),
            (Robot(currentposition: Position(x: 3, y: 2), orientation: .N), "FRRFLLFFRRFLL"),
            (Robot(currentposition: Position(x: 4, y: 3), orientation: .W), "LFLFRF")]
        
        let output = try? simulateRobots(gridSize: Position(x: 5, y: 3), input)
        
        XCTAssertEqual(output?.count, 3)
        
       // First Robot position and Orientation
        XCTAssertEqual(output?[0].position, Position(x: 1, y: 1))
        XCTAssertEqual(output?[0].orientation, .E)
        
        // is first robot lost
        XCTAssertEqual(output?[0].isLost, false)

        // Second Robot position and Orientation

        XCTAssertEqual(output?[1].position, Position(x: 3, y: 3))
        XCTAssertEqual(output?[1].orientation, .N)
        
        // is first robot lost
        XCTAssertEqual(output?[1].isLost, true)
        
        // Third Robot position and Orientation

        XCTAssertEqual(output?[2].position, Position(x: 5, y: 1))
        XCTAssertEqual(output?[2].orientation, .S)
        
        // is 3rd robot lost
        XCTAssertEqual(output?[2].isLost, false)
    }
}
