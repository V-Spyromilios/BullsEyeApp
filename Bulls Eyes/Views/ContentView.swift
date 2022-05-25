//
//  ContentView.swift
//  Bulls Eyes
//  Created by Evangelos Spyromilios on 11.05.22.
//

import SwiftUI

struct ContentView: View
{
	@State private var alertIsVisible: Bool = false
	@State private var sliderValue: Double = 42.0
	@State var game: Game = Game()
	
	var body: some View
	{
		ZStack
		{
			BackgroundView(game: $game) //padding inside
			VStack
			{
				//ImageView()
				IntructionsView(text: "Try to hit the Target".uppercased(), game: $game)
				sliderView(sliderValue: $sliderValue, textLeft: "0", textRight: "100")
				theButton(alert: $alertIsVisible, sliderValue: $sliderValue, game: $game).padding(.top, 50)
				
			}
			
		}
		
	}
	struct ContentView_Previews: PreviewProvider {
		static var previews: some View {
			ContentView()
				.preferredColorScheme(.dark)
				.previewInterfaceOrientation(.landscapeLeft)
			ContentView()
				.preferredColorScheme(.light)
				.previewInterfaceOrientation(.portrait)
		}
	}
}
