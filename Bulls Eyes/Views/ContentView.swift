//
//  ContentView.swift
//  Bulls Eyes
//  Created by Evangelos Spyromilios.
//

import SwiftUI

struct ContentView: View
{
	@Environment(\.verticalSizeClass) var verticalSizeClass
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@State private var alertIsVisible: Bool = false
	@State private var sliderValue: Double = 42.0
	@State var game: Game = Game()

	var body: some View
	{
		ZStack
		{
			BackgroundView(game: $game)
			VStack
			{
				if (verticalSizeClass == .compact && horizontalSizeClass == .compact && alertIsVisible)
				{
				IntructionsView(text: "🎯🎯🎯", game: $game).padding(.bottom, alertIsVisible ? 0: 50).blur(radius: alertIsVisible ? 4: 0)
				}
				else
				{
				IntructionsView(text: "🎯🎯🎯 \nTry to hit the Target".uppercased(), game: $game).padding(.bottom, alertIsVisible ? 0: 50).blur(radius: alertIsVisible ? 5: 0)
				}
				BigNumber(text: String(game.target))
				if !alertIsVisible
				{
					sliderView(sliderValue: $sliderValue, textLeft: "0", textRight: "100").padding(.bottom, 30).transition(.scale)
					theButton(alert: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
				}
				else
				{
					PointsView(sliderValue: $sliderValue, game: $game, alertIsVisible: $alertIsVisible).transition(.scale)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
			ContentView()
				.preferredColorScheme(.light)
				.previewInterfaceOrientation(.landscapeLeft)
		ContentView()
			.preferredColorScheme(.dark)
			.previewInterfaceOrientation(.portrait)
	}
}
