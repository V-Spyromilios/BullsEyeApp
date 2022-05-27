//
//  theButton.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 18.05.22.
//

import SwiftUI

struct theButton: View {
	@Binding var alert: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	
	var body: some View {
		Button(action: {
			withAnimation{
			alert.toggle()
			}
			})
		{
			Text("Hit Me!".uppercased()).font(.title2).bold()
			
		}.padding(.all).background(ZStack
								   {
			Color("ButtonColor")
			LinearGradient(gradient: Gradient(colors:[Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)

		}
		)
		.foregroundColor(.white)
		.cornerRadius(20.0)
		.overlay(
				RoundedRectangle(cornerRadius: 20.0)
				  .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
			  )
		.padding(.bottom)
		.alert(isPresented: $alert, content: {
			let asInt: Int = Int(self.sliderValue)
			let points = game.fn_points(sliderValue: asInt)

			return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(asInt).\n" + "You scored \(points) points this round."), dismissButton: .default(Text("OK")))
			})
			}

		}


struct theButton_Preview: PreviewProvider {
	@Binding var alert: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	static var previews: some View {
		theButton(alert: .constant(true), sliderValue: .constant(40.0), game: .constant(Game()))
	}
}
