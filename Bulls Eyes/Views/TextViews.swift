//
//  TextViews.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 16.05.22.
//

import SwiftUI

struct IntructionsView: View
{
	var text: String
	@Binding var game: Game

    var body: some View
	{
		VStack
		{
			Text(text)
				.foregroundColor(Color("TextColor"))
				.italic()
				.bold()
				.kerning(0.5)
				.multilineTextAlignment(.center)
				.font(.title2)
				.lineSpacing(4.0)
		}
    }
}

struct BigNumber: View
{
	var text:String

	var body: some View
	{
		Text(text)
			.kerning(-1.0)
			.font(.title)
			.fontWeight(.black)
			.padding()
			.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
	}
}

struct sliderView: View
{
	@Binding var sliderValue: Double
	var textLeft:String
	var textRight:String

	var body: some View
	{
		HStack
		{
			Text(textLeft)
				.foregroundColor(Color("TextColor"))
				.font(.title2).bold()
				.frame(width: 40.0)
			Slider(value: $sliderValue, in: 0.0...100.0)
			Text(textRight)
				.foregroundColor(Color("TextColor"))
				.font(.title2).bold()
				.frame(width: 40.0)
		}
	}
}

struct LabelText: View
{
	var text: String

	var body: some View
	{
		Text(text)
			.font(.caption)
			.bold()
			.kerning(1.5)
			.foregroundColor(Color("TextColor"))
	}
}

struct BodyText: View
{
	var text: String

	var body: some View
	{
		Text(text)
			.font(.subheadline)
			.fontWeight(.semibold)
			.multilineTextAlignment(.center)
			.lineSpacing(12.0)
	}
}

struct LeaderboardroundedText: View
{
	var text: String

	var body: some View
	{
		Text(text)
			.font(.subheadline)
			.fontWeight(.semibold)
			.multilineTextAlignment(.center)
			.lineSpacing(12.0)
	}
}

struct ButtonText: View
{
	var text: String

	var body: some View
	{
		Text(text)
			.bold()
			.padding()
			.frame(maxWidth: 300)
			.foregroundColor(.white)
			.background(Color.accentColor)
			.cornerRadius(Constants.General.roundRectCornerRadius)
	}
}

struct leaderScoreView: View
{
	let score: Int

	var body: some View
	{
		Text(String(score))
			.bold()
			.font(.title3)
			.kerning(-0.2)
			.foregroundColor(Color("TextColor"))
	}
}

struct leaderDateView: View
{
	let date: Date

	var body: some View
	{
		Text(date,style: .time)
			.font(.title3)
			.bold()
			.kerning(-0.2)
			.foregroundColor(Color("TextColor"))
	}
}

struct bigBoldText: View
{
	let text: String

	var body: some View
	{
		Text(text.uppercased())
			.font(.title)
			.kerning(2.0)
			.foregroundColor(Color("TextColor"))
			.fontWeight(.black)
	}
}

struct TextViews_Previews: PreviewProvider
{
	@Binding var sliderValue:Double

	static var previews: some View
	{
		VStack
		{
			IntructionsView(text: "TEST", game: .constant(Game()))
			BigNumber(text: "42")
			sliderView(sliderValue: .constant(50.0), textLeft: "0", textRight: "100")
			LabelText(text: "420")
			BodyText(text: "You scored 200 points! \n 🎉🎉🎉")
			ButtonText(text: "Start New Round").padding()
			leaderScoreView(score: 1200)
			leaderDateView(date: Date())
			Spacer()
			bigBoldText(text: "leaderboard")
		}
	}
}
