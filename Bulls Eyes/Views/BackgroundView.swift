//
//  BackgroundView.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 19.05.22.
//

import SwiftUI

struct BackgroundView: View {
	@Binding var game: Game

    var body: some View {
				VStack {
					topView(game: $game).padding(.horizontal)
					Spacer()
					bottomView(game: $game).padding()
				}
				.padding()
				.background(ringsView()) //not as Zstack containing ringsView and Vstack of other views
			
    }
}

struct topView: View {
	@Binding var game: Game

	var body: some View {
		HStack {
			RoundedImageStroked(game: $game, systemName: "arrow.counterclockwise")
				Spacer()
			RoundedImageFilled(systemName: "list.dash")
				
		}
	}
}

struct bottomView: View {
	@Binding var game: Game

	var body: some View {
		HStack {
			VStack(spacing: 5) {
				LabelText(text: "SCORE")
				RoundRectText(text: String(game.score))
				}
			Spacer()
			VStack(spacing: 5) {
				LabelText(text: "ROUND")
				RoundRectText(text: String(game.round))
				}
		}
		
	}
}

struct ringsView: View {
	var body: some View {
		ZStack {
			Color("LightBackgroundColor")
		.edgesIgnoringSafeArea(.all)
			ForEach(1..<6) {ring in let size = CGFloat(ring * 100)
				let opac: Double = abs(1.0 - Double(size / 1000 * 1.5))
			Circle()
					.fill(RadialGradient(colors: Color("ringsColor"), center: <#UnitPoint#>, startRadius: 100.0, endRadius: 300.0))
					.frame(width: size, height: size)
			}
		}
}
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
			
			BackgroundView(game: .constant(Game()))
				//.preferredColorScheme(.dark)
			// Instane Just For Preview
		
    }
}
