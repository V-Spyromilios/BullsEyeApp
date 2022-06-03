//
//  RoundedViews.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 19.05.22.
//

import SwiftUI

struct RoundedImageFilled: View
{
	var systemName: String

	var body: some View
	{
		Image(systemName: systemName)
				.symbolRenderingMode(.hierarchical)
				.font(.title) ///the size of the SF image
				.foregroundColor(Color("ButtonFilledTextColor"))
				.frame(width: 56.0, height: 56.0)
				.background(
					Circle()
						.fill(Color("ButtonFilledColor")))
	}
}


struct PreviewViewFilled: View
{
	@Binding var leaderIsVisible: Bool
	@Binding var game: Game

	var body: some View
	{
		RoundedImageFilled(systemName: "list.dash")
	}
}

struct RoundRectText: View
{
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
					.stroke(lineWidth: Constants.General.strokeWidth)
					.foregroundColor(Color("ButtonStrokeColor")))
	}
}

struct RoundedImageStroked: View
{
	@Binding var game: Game
	var systemName: String

    var body: some View
	{
		withAnimation {
			Button(action: {game.startOver()}) ///action inside {} new {} for content. SF Symbols are not active 'ready' buttons. Need to add Button(action, Content)
			{
			Image(systemName: systemName)
				.symbolRenderingMode(.hierarchical)
				.font(.title)
				.foregroundColor(Color("TextColorStroke"))
				.frame(width: 56.0, height: 56.0)
				.overlay(
					Circle()
						.stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth))
				.padding(.top)
			}
		}
	}
}

struct PreviewViewStroked: View
{
	@Binding var game: Game

	var body: some View
	{
		RoundedImageStroked(game: .constant(Game()), systemName: "arrow.counterclockwise")
	}
}

struct leaderIndexView : View
{
	let index: Int
	
	var body: some View {
		Text(String(index))
			.font(.title)
			.kerning(-0.2)
			.bold()
			.foregroundColor(Color("TextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength, alignment: .center)
			.overlay((Circle()
				.strokeBorder(Color("LeaderboardColor"), lineWidth: Constants.General.strokeWidth)))
	}
}

struct RoundedViews_Previews: PreviewProvider
{
	@Binding var game: Game

    static var previews: some View
	{
		HStack(spacing: 30.0)
		{
			leaderIndexView(index: 4)
			PreviewViewStroked(game: .constant(Game()))
			PreviewViewFilled(leaderIsVisible: .constant(true), game: .constant(Game()))
			RoundRectText(text: "120")
		}
		HStack(spacing: 30.0)
		{
			leaderIndexView(index: 4)
			PreviewViewStroked(game: .constant(Game()))
			PreviewViewFilled(leaderIsVisible: .constant(true), game: .constant(Game()))
			RoundRectText(text: "120")
				.preferredColorScheme(.dark)
		}
    }
}

