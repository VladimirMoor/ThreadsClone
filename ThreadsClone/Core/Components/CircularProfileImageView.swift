//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
		Image("human2")
			.resizable()
			.scaledToFill()
			.frame(width: 40, height: 40)
			.clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
