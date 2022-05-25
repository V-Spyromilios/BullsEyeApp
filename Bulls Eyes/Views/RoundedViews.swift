//
//  RoundedViews.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 19.05.22.
//

import SwiftUI

struct RoundedImageFilled: View {
	var systemName: String
	var body: some View {
			Image(systemName: systemName)
				.font(.title)
				.foregroundColor(Color("ButtonFilledTextColor"))
				.frame(width: 56.0, height: 56.0)
				.background(
				Circle()
					.fill(Color("ButtonFilledColor")))
				.padding(.top)
	}
}

struct PreviewViewFilled: View {
	var body: some View {
		RoundedImageFilled(systemName: "list.dash")
	}
}

struct RoundRectText: View {
	var text: String

	var body: some View {
		Text(text)
			.kerning(-0.2)
			.bold()
			.font(.title3)
			.frame(width: 68.0, height: 56.0)
			.foregroundColor(Color("TextColor"))
			.overlay(
				RoundedRectangle(cornerRadius: 21.0)
					.stroke(lineWidth: 2.0) //stroke makes it also transparent!
					.foregroundColor(Color("ButtonStrokeColor"))
			)
	}
}



struct RoundedImageStroked: View {
	@Binding var game: Game
	var systemName: String
    var body: some View {
		Button(action: {game.startOver()}) //action inside {} new {} for content. SF Symbols are not active 'ready' buttons. Need to add Button(action, Content)
		{
			Image(systemName: systemName)
				.font(.title)
				.foregroundColor(Color("TextColorStroke"))
				.frame(width: 56.0, height: 56.0)
				.overlay(
					Circle()
						.stroke(Color("ButtonStrokeColor"), lineWidth: 2.0)
				)
				.padding(.top)
	}
}
}

struct PreviewViewStroked: View {
	@Binding var game: Game
	var body: some View {
		RoundedImageStroked(game: .constant(Game()), systemName: "arrow.counterclockwise")
	}
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
		HStack(spacing: 30.0) {
			PreviewViewStroked(game: .constant(Game()))
			PreviewViewFilled()
			RoundRectText(text: "120")
		}
		HStack(spacing: 30.0) {
			PreviewViewStroked(game: .constant(Game()))
			PreviewViewFilled()
			RoundRectText(text: "120")
				.preferredColorScheme(.dark)
		}
    }
}
