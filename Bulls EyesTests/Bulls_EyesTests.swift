//
//  Bulls_EyesTests.swift
//  Bulls EyesTests
//
//  Created by Evangelos Spyromilios on 13.05.22.
//

import XCTest
@testable import Bulls_Eyes

class Bulls_EyesTests: XCTestCase
{
	var game: Game!

    override func setUpWithError() throws
	{
        // Put setup code here. This method is called before the invocation of each test method in the class.
		game = Game()
    }

    override func tearDownWithError() throws
	{
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		game = nil
    }

    func testScorePossitive() throws
	{
		let guess = game.target + 5
		let score = game.fn_points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}

	func testScoreExact() throws
	{
		let guess = game.target
		let score = game.fn_points(sliderValue: guess)
		XCTAssertEqual(score, 200)
	}

	func testScoreClose() throws
	{
		let guess = game.target + 1
		let score = game.fn_points(sliderValue: guess)
		XCTAssertEqual(score, 99 + 50)
	}

	func testNewRound() throws
	{
		game.startNewRound(points: 100)
		XCTAssertEqual(game.score, 100)
		XCTAssertEqual(game.round, 2)
	}

	func testStartOver() throws
	{
		game.startNewRound(points: 100)
		XCTAssertNotEqual(game.score, 0)
		XCTAssertNotEqual(game.round, 1)
		game.startOver()
		XCTAssertEqual(game.score, 0)
		XCTAssertEqual(game.round, 1)
	}

	func testLeaderboard() throws
	{
		game.startNewRound(points: 100)
		XCTAssertEqual(game.round, 2)
		XCTAssertEqual(game.leaderboardEntries[0].points, 100)
		game.startNewRound(points: 150)
		XCTAssertEqual(game.round, 3)
		XCTAssertEqual(game.leaderboardEntries[0].points, 150)
		XCTAssertEqual(game.leaderboardEntries[1].points, 100)
	}
}
