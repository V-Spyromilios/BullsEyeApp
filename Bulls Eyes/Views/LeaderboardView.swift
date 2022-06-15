//
//  LeadrboardView.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 27.05.22.
//

import SwiftUI

struct LeadboardView: View
{
	@Binding var leaderIsVisible: Bool
	@Binding var game: Game

	var body: some View
	{
		ZStack
		{
			Color("LightBackgroundColor").edgesIgnoringSafeArea(.all)
			VStack()
			{
				headerView(leaderIsVisible: $leaderIsVisible)
				Spacer()
			labelViews()
				ScrollView
				{
					if (!$game.leaderboardEntries.isEmpty)
					{
						VStack(spacing: 8)
						{
							ForEach($game.leaderboardEntries.indices)
							{
								i in let leaderboardEntry = game.leaderboardEntries[i]
								rowView(index: i + 1, score: leaderboardEntry.points, date: leaderboardEntry.date)
							}
						}
					}
					else
					{
						emptyLeaderView(text: "leaderboard is empty!".uppercased()).padding()
					}
				}
				Spacer()
			}
		}
	}
}

struct emptyLeaderView : View
{
	let text: String

	var body: some View
	{
		Text(text)
			.font(.callout)
			.kerning(1.0)
			.fontWeight(.black)
			.foregroundColor(Color("TextColor"))
			.frame(width: Constants.Leaderboard.maxRowWidth)
			.padding()
			.shadow(color: Color("TextColor"), radius: 10.0, x: 5.0, y: 5.0)
			
	}
}

struct rowView: View
{
	let index: Int
	let score: Int
	let date: Date

	var body: some View
	{
		HStack
		{
			leaderIndexView(index: index)
			Spacer()
			leaderScoreView(score: score)
				.frame(width: Constants.Leaderboard.scoreColWidth)
			Spacer()
			leaderDateView(date: Date())
				.frame(width: Constants.Leaderboard.dateColWidth)
		}
		.background(RoundedRectangle(cornerRadius: .infinity)
		.strokeBorder(Color("LeaderboardColor"), lineWidth: Constants.General.strokeWidth))
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.maxRowWidth)
	}
}

struct headerView: View
{
	@Binding var leaderIsVisible: Bool
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@Environment(\.horizontalSizeClass) var horizontalSizeClass

	var body: some View
	{
		ZStack
		{   /// bigBold  remains centered. spacer pushes button to the right of the bigBold
			HStack
			{
				if (verticalSizeClass == .regular && horizontalSizeClass == .compact)
				{
					bigBoldText(text: "leaderboard").padding(.leading)
				}
				else
				{
					bigBoldText(text: "leaderboard").frame(width: Constants.Leaderboard.maxRowWidth)
				}
				withAnimation
				{
					Button(action: {leaderIsVisible = false })
					{
						RoundedImageFilled(systemName: "xmark")
							.accessibilityLabel("Close leaderboard")
							.padding()
					}
				}
			}
		}
	}
}
	


struct labelViews: View {
	var body: some View {
		HStack {
			Spacer()
				.frame(width: Constants.General.roundedViewLength) ///without height so total framing is minimum and close to rowView
			Spacer()
			LabelText(text: "Score".uppercased())
				.frame(width: Constants.Leaderboard.scoreColWidth)
			Spacer()
			LabelText(text: "Time".uppercased())
				.frame(width: Constants.Leaderboard.dateColWidth)
		}
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.maxRowWidth)
	}
}


struct LeaderboardView_Previews: PreviewProvider {
	static private var game = Binding.constant(Game(demoData: true))
	static private var leaderIsVisible = Binding.constant(false)

	static var previews: some View {
		
		LeadboardView(leaderIsVisible: leaderIsVisible, game: game)
			.preferredColorScheme(.light)
			.previewInterfaceOrientation(.landscapeLeft)

		LeadboardView(leaderIsVisible: leaderIsVisible, game: game)
			.preferredColorScheme(.dark)
			
	}	
}

