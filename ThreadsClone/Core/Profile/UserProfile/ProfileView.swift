//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI
// need to edit

struct ProfileView: View {
	
	let user: User

	var body: some View {
		ScrollView {
			// bio and stats
			VStack(spacing: 20) {
				ProfileHeaderView(user: user)
				
				Button {
					
				} label: {
					Text("Follow")
						.font(.subheadline)
						.fontWeight(.semibold)
						.frame(maxWidth: .infinity)
				}
				.buttonStyle(.borderedProminent)
				.controlSize(.large)
				.tint(.black)
				
				// user content list view
				UserContentListView(user: user)
			}
		}
		.navigationBarTitleDisplayMode(.inline)
		.scrollIndicators(.hidden)
		.padding(.horizontal)
	}
}

#Preview {
	ProfileView(user: User.mock)
}
