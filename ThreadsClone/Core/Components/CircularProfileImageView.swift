//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI
import NukeUI

struct CircularProfileImageView: View {
	var user: User?
	
	init(user: User?) {
		self.user = user
	}
	
	var body: some View {
			if let urlStr = user?.profileImageUrl,
			   let imageURL = URL(string: urlStr) {
				LazyImage(url: imageURL) { state in
					if let image = state.image {
						image
							.resizable()
							.scaledToFill()
							.frame(width: 40, height: 40)
							.clipShape(.circle)
					} else if state.error != nil {
						Color.red
							.frame(width: 40, height: 40)
							.clipShape(.circle) // Indicates an error
					} else {
						ProgressView()
							.frame(width: 40, height: 40) // Acts as a placeholder
					}
				}
			} else {
				Image(systemName: "person.circle.fill")
					.resizable()
					.frame(width: 40, height: 40)
					.foregroundColor(Color(.systemGray4))
			}
	}
}

#Preview {
	CircularProfileImageView(user: User.mock)
}
