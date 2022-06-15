//
//  Shapes.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 19.05.22.
//

import SwiftUI

struct Shapes: View
{
    var body: some View
	{
		VStack
		{
			Ellipse()
				.inset(by: 10.0)
				.stroke(Color.yellow, lineWidth: 20.0)
				.frame(width: 200.0, height: 200.0, alignment: .center)
				.background(Color.red)
				.cornerRadius(30.0)
			RoundedRectangle(cornerRadius: 40.0)
				.stroke(Color.yellow, lineWidth: 21.0)
				.foregroundColor(Color.green)
		}
    }
}

struct Shapes_Previews: PreviewProvider
{
    static var previews: some View
	{
        Shapes()
    }
}
