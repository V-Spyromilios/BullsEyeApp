//
//  Game.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 13.05.22.
//

import Foundation


struct Game
{
	var round: Int = 1
	var score: Int = 0
	var target: Int = Int.random(in: 0...100)
	var points: Int = 0

	func fn_points(sliderValue: Int) -> Int
	{
		let diff = abs(target - sliderValue)
		let bonus: Int
		if diff == 0 {
			bonus = 100
			return (100 - diff + bonus)
		}
		else if diff <= 2 {
			bonus = 50
			return (100 - diff + bonus)
		}
		else {
			return (100 - diff)
		}
	}

	
	mutating func startNewRound(points: Int) -> Void {
		round += 1
		score += points
		target = Int.random(in: 1...100)
	}
	
	mutating func startOver() {
		round  = 1
		score = 0
		target = Int.random(in: 1...100)
	}
}


