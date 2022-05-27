//
//  PointsView.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 27.05.22.
//

import SwiftUI

struct PointsView: View {
	@Binding var sliderValue: Double
	@Binding var game: Game
	@Binding var alertIsVisible: Bool

    var body: some View {
		let asInt: Int = Int(sliderValue.rounded())
		let points = game.fn_points(sliderValue: asInt)
		
			VStack(spacing: 10) {
			IntructionsView(text: "The Slider's Value is", game: $game)
			BigNumber(text: String(Int(sliderValue)))
			BodyText(text: "You scored \(points) points this round!")
				Button(action: {
					game.startNewRound(points: points)
					withAnimation {
						alertIsVisible.toggle()
					}
				}){
				ButtonText(text: "Start New Round")
				}
			}
			.padding()
			.frame(maxWidth: 300)
			.background(Color("BackgroundColor"))
			.cornerRadius(22.0)
			.shadow(color: .gray, radius: 10, x: 5.0, y: 5.0)
			.transition(.scale)
	}
}

struct PointsView_Previews: PreviewProvider {
	static private var alertIsVisible = Binding.constant(false)
	static private var sliderValue = Binding.constant(50.0)
	static private var game = Binding.constant(Game())
	
    static var previews: some View {
		
		PointsView(sliderValue: sliderValue, game: game, alertIsVisible: alertIsVisible)
		.preferredColorScheme(.dark)
		.previewInterfaceOrientation(.portrait)
		
//		PointsView(sliderValue: .constant(50.0), game: .constant(Game()))
//		.preferredColorScheme(.light)
//		.previewInterfaceOrientation(.portrait)
//
//		PointsView(sliderValue: .constant(50.0), game: .constant(Game()))
//			.preferredColorScheme(.dark)
//			.previewInterfaceOrientation(.landscapeLeft)
//		PointsView(sliderValue: .constant(50.0), game: .constant(Game()))
//		.preferredColorScheme(.dark)
//		.previewInterfaceOrientation(.portrait)
	}
}
