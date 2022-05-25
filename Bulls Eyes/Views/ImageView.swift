//
//  ImageView.swift
//  Bulls Eyes
//
//  Created by Evangelos Spyromilios on 16.05.22.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
		Image("bull6")
			.resizable()
			.cornerRadius(21.0)
			.shadow(radius: 5.0)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
