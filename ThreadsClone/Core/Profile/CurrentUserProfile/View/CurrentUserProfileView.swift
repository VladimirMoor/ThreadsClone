//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 14.01.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
	@StateObject var viewModel = CurrentUserProfileViewModel()
	@State private var showEditProfile = false
	
	private var currentUser: User? {
		return viewModel.currentUser
	}
    var body: some View {
		NavigationStack {
			ScrollView {
				// bio and stats
				VStack(spacing: 20) {

					ProfileHeaderView(user: currentUser)
					
					Button {
						showEditProfile.toggle()
					} label: {
						Text("Edit Profile")
							.font(.subheadline)
							.fontWeight(.semibold)
							.frame(height: 46)
							.frame(maxWidth: .infinity)
							.foregroundStyle(.black)
							.background {
								RoundedRectangle(
									cornerRadius: 8,
									style: .continuous
								)
								.stroke(.gray, lineWidth: 1)
							}
					}
					.buttonStyle(.plain)

					// user content list view
					if let user = currentUser {
						UserContentListView(user: user)
					}
				}
				.padding(.horizontal)
			}
			.sheet(isPresented: $showEditProfile) {
				if let user = currentUser {
					EditProfileView(user: user)
				}
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						AuthService.shared.signOut()
					} label: {
						HStack {
							Text("sing out")
								.font(.caption)
							Image(systemName: "rectangle.portrait.and.arrow.right")
						}
					}
					.buttonStyle(.bordered)
					.tint(Color.black)
				}
			}
			.scrollIndicators(.hidden)
			
		}
    }
}

#Preview {
	NavigationStack {
		CurrentUserProfileView()
	}
}
