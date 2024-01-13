//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI
// need to edit

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewModel()
	@State private var selectedFilter: ProfileThreadFilter = .threads
	@Namespace var animation
	
	private var currentUser: User? {
		return viewModel.currentUser
	}
	
    var body: some View {
		NavigationStack {
			ScrollView {
				// bio and stats
				VStack(spacing: 20) {
					HStack(alignment: .top) {
						VStack(alignment: .leading, spacing: 12) {
							// fullname and username
							VStack(alignment: .leading , spacing: 4) {
								Text(currentUser?.fullname ?? "")
									.font(.title2)
									.fontWeight(.semibold)
								
								Text(currentUser?.username ?? "")
									.font(.subheadline)
							}
							
							if let bio = currentUser?.bio {
								Text(bio)
							}
							
							Text("2 followers")
								.font(.caption)
								.foregroundStyle(.gray)
							
						}
						
						Spacer()
						
						CircularProfileImageView()
					}
					
					Button {
						
					} label: {
						Text("Follow")
							.font(.subheadline)
							.fontWeight(.semibold)
							.frame(height: 32)
							.frame(maxWidth: .infinity)
					}
					.buttonStyle(.borderedProminent)
					.controlSize(.regular)
					.tint(.black)
					
					// user content list view
					VStack {
						HStack {
							ForEach(ProfileThreadFilter.allCases) { filter in
								VStack {
									Text(filter.title)
										.font(.subheadline)
										.fontWeight(selectedFilter == filter ? .semibold : .regular)
									//disable animation to the font weight
										.transaction { transaction in
											transaction.animation = nil
										}
									
									if selectedFilter == filter {
										// underline
										Rectangle()
											.foregroundStyle(.black)
											.frame(height: 1)
											.matchedGeometryEffect(id: "underline", in: animation)
									} else {
										// clear color underline stub for UI fix
										Rectangle()
											.foregroundStyle(.clear)
											.frame(height: 1)
									}
								}
								.onTapGesture {
									withAnimation(.spring) {
										selectedFilter = filter
									}
								}
							}
						}
						
						LazyVStack {
							ForEach(0...40, id:\.self) { thread in
								ThreadCell()
							}
						}
						
					}
					.padding(.vertical, 8)
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
			.padding(.horizontal)
		}
    }
}

#Preview {
    ProfileView()
}
