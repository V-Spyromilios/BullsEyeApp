//
//  LeadrboardView.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 27.05.22.
//

import SwiftUI

struct RoundedTextView: View {
	@Binding var game: Game
	var text: String

	var body: some View {
	Text(text)
			.font(.title2)
			.bold()
			.foregroundColor(Color("TextColor"))
			.frame(width: 20.0, height: Constants.General.roundedViewHeight)
			.padding()
			.overlay {
				Circle()
					.stroke(lineWidth: 1.0)
					.foregroundColor(Color("ButtonStrokeColor"))
			}
		
		
	}
}

struct ScoreTextView: View {
	@Binding var game: Game
	var text: String

	var body: some View {
	Text(text)
			.font(.title3)
			.foregroundColor(Color("TextColor"))
			.padding(.all, 7)
	}
}

struct DateTextView: View {
	@Binding var game: Game

	var body: some View {
	Text(Date(), style: .time)
			.font(.title3)
			.foregroundColor(Color("TextColor"))
			.padding(.all, 9)
	}
}


struct LeaderboardView: View {
	@Binding var game: Game
    var body: some View {
		HStack {
			RoundedTextView(game: $game, text: "2")
			Spacer()
			ScoreTextView(game: $game, text: "142")
			Spacer()
			DateTextView(game: $game).padding(.horizontal, 5)
		}
		.frame(width: 300, height: 52)
		//.shadow(radius: 20.0) ??WTF
		.overlay(
			RoundedRectangle(cornerRadius: 150)
				.stroke(lineWidth: 1.0)
				.foregroundColor(Color("ButtonStrokeColor"))
		)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
	@Binding var game: Game
    static var previews: some View {
		LeaderboardView(game: .constant(Game()))
	}
}
