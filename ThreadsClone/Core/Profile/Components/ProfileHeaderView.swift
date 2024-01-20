//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 14.01.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
	var user: User?
	
	init(user: User?) {
		self.user = user
	}
	
    var body: some View {
		HStack(alignment: .top) {
			VStack(alignment: .leading, spacing: 12) {
				// fullname and username
				VStack(alignment: .leading , spacing: 4) {
					Text(user?.fullname ?? "")
						.font(.title2)
						.fontWeight(.semibold)
					
					Text(user?.username ?? "")
						.font(.subheadline)
				}
				
				if let bio = user?.bio {
					Text(bio)
				}
				
				Text("2 followers")
					.font(.caption)
					.foregroundStyle(.gray)
				
			}
			
			Spacer()
			
			CircularProfileImageView(user: user)
		}
    }
}

#Preview {
	ProfileHeaderView(user: User.mock)
}
