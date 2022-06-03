//
//  Game.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 13.05.22.
//

import Foundation

struct LeaderboardEntry {
	var points: Int
	var date: Date
}


struct Game
{
	var round: Int = 1
	var score: Int = 0
	var target: Int = Int.random(in: 0...100)
	var points: Int = 0
	var leaderboardEntries: [LeaderboardEntry] = []

	init(demoData: Bool = false) {
		if demoData {
			self.leaderboardEntries.append(LeaderboardEntry(points: 10, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 8, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 30, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 100, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 90, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 12, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 100, date: Date()))
			self.leaderboardEntries.append(LeaderboardEntry(points: 50, date: Date()))
			self.leaderboardEntries.sort{ $0.points > $1.points}
		}
	}

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
		let date: Date = Date()
		newEntry(leaderboardEntries: leaderboardEntries, points: points, date: date)
		target = Int.random(in: 1...100)
	}
	
	mutating func startOver() {
		round  = 1
		score = 0
		target = Int.random(in: 1...100)
		self.leaderboardEntries.removeAll()
		}

	mutating func newEntry(leaderboardEntries: [LeaderboardEntry], points: Int, date:Date) {
		self.leaderboardEntries.append(LeaderboardEntry(points: points, date: date))
		self.leaderboardEntries.sort{ $0.points > $1.points}   ///self is required as "leaderboardEntries is immutable (let)" ??
	}
}
