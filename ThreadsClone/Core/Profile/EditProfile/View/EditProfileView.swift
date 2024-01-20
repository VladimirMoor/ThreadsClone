//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 08.01.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
	@State private var bio = ""
	@State private var link = ""
	@State private var isPrivateProfile = false
	@Environment(\.dismiss) var dismiss
	@StateObject var viewModel = EditProfileViewModel()
	var body: some View {
		NavigationStack {
			ZStack {
				Color(.systemGroupedBackground)
					.ignoresSafeArea(edges: [.horizontal, .bottom])
				
				
				VStack {
					// Name and profile image
					HStack {
						VStack(alignment: .leading) {
							Text("Name")
								.fontWeight(.semibold)
							
							Text("John Appleseed")
						}
						
						Spacer()
						
						PhotosPicker(selection: $viewModel.selectedItem) {
							if let image = viewModel.profileImage {
								image
									.resizable()
									.scaledToFill()
									.frame(width: 40, height: 40)
									.clipShape(.circle)
							} else {
								CircularProfileImageView()
							}
						}
					}
					
					Divider()
					
					// bio field
					
					VStack(alignment: .leading) {
						Text("Bio")
							.fontWeight(.semibold)
						
						TextField("Enter your bio...", text: $bio, axis: .vertical)
					}
					
					Divider()
					
					VStack(alignment: .leading) {
						Text("Link")
							.fontWeight(.semibold)
						
						TextField("Add link...", text: $link)
					}
					
					Divider()
					
					Toggle("Private profile", isOn: $isPrivateProfile)
				}
				.font(.footnote)
				.padding()
				.background {
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color(.systemGray4), lineWidth: 1)
						.fill(.white)
				}
				.padding()
			}
			.navigationTitle("Edit Profile")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Button("Cancel") {
						dismiss()
					}
					.font(.subheadline)
					.foregroundStyle(.black)
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					Button("Done") {
						Task {
							try await viewModel.updateUserData()
							dismiss()
						}
					}
					.font(.subheadline)
					.fontWeight(.semibold)
					.foregroundStyle(.black)
				}
			}
		}
		
	}
}

#Preview {
	NavigationStack {
		EditProfileView()
	}
}
