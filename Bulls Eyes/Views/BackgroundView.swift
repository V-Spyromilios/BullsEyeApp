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
				//.padding()
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
	@Environment(\.colorScheme) var colorScheme
	var body: some View {
		ZStack {
			Color("LightBackgroundColor")
		.edgesIgnoringSafeArea(.all)
			ForEach(1..<6) {ring in let size = CGFloat(ring * 100)
				let opac = colorScheme == .dark ? 0.1: 0.3
			Circle()
					.stroke(lineWidth: 20.0)
					.fill(RadialGradient(colors: [Color("ringsColor").opacity(opac * 0.8), Color("ringsColor").opacity(0.0)], center:.center, startRadius: 200, endRadius: 300))
					.frame(width: size, height: size)
			}
		}
	}
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
			
			BackgroundView(game: .constant(Game()))
				.preferredColorScheme(.dark)
			//.previewInterfaceOrientation(.landscapeLeft)
			// Instane Just For Preview
		
    }
}
