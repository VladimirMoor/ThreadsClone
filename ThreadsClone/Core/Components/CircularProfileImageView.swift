//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI

struct CircularProfileImageView: View {
	var user: User?
	
	init(user: User?) {
		self.user = user
	}
	
	var body: some View {
		
		if let urlStr = user?.profileImageUrl,
		   let imageURL = URL(string: urlStr) {
			AsyncImage(url: imageURL) { image in
				image
					.resizable()
					.scaledToFill()
					.frame(width: 40, height: 40)
					.clipShape(.circle)
			} placeholder: {
				ProgressView()
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
