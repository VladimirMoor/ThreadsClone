//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct ProfileView: View {
	@State private var selectedFilter: ProfileThreadFilter = .threads
	@Namespace var animation
    var body: some View {
		ScrollView {
			// bio and stats
			VStack(spacing: 20) {
				HStack(alignment: .top) {
					VStack(alignment: .leading, spacing: 12) {
						// fullname and username
						VStack(alignment: .leading , spacing: 4) {
							Text("Aizac Ibrghimovich")
								.font(.title2)
								.fontWeight(.semibold)
							
							Text("aizac_the_best")
								.font(.subheadline)
						}
						
						Text("Some long bio where user is describe himself and who is he as he think. Maybe some long text and we need to restrict it with some limits to the words number at least.")
						
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
		.scrollIndicators(.hidden)
		.padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
