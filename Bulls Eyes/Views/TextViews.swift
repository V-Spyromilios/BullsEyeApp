//
//  TextViews.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 16.05.22.
//

import SwiftUI

struct IntructionsView: View {
	var text: String
	@Binding var game: Game
    var body: some View {
		VStack {
			Text("🎯🎯🎯")
			Text(text)
				.foregroundColor(Color("TextColor"))
				.italic()
				.bold()
				.kerning(0.5)
				.multilineTextAlignment(.center)
				.font(.title2)
				.lineSpacing(4.0)
			BigNumber(text: String(game.target))
		}
    }
}

struct BigNumber: View {
	var text:String
	
	var body: some View {
		Text(text)
			.kerning(-1.0)
			.font(.title)
			.fontWeight(.black)
			.padding()
			.border(Color.red, width: 4)
			.shadow(radius: 5.0)
			.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
	}
}

struct sliderView: View {
	@Binding var sliderValue: Double
	var textLeft:String
	var textRight:String
	var body: some View {
		HStack {
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


struct LabelText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.font(.caption)
			.bold()
			.kerning(1.5)
			.foregroundColor(Color("TextColor"))
	}
}

struct TextViews_Previews: PreviewProvider {
	@Binding var sliderValue:Double
	static var previews: some View {
		VStack {
			IntructionsView(text: "TEST", game: .constant(Game()))
			sliderView(sliderValue: .constant(50.0), textLeft: "0", textRight: "100")
			
			LabelText(text: "42")
			
		}
	}
}
