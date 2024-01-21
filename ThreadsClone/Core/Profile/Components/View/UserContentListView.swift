//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 15.01.2024.
//

import SwiftUI

struct UserContentListView: View {
	@StateObject var viewModel: UserContentListViewModel
	@State private var selectedFilter: ProfileThreadFilter = .threads
	@Namespace private var animation
	
	init(user: User) {
		self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
	}
	
    var body: some View {
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
				ForEach(viewModel.threads) { thread in
					ThreadCell(thread: thread)
				}
			}
			
		}
		.padding(.vertical, 8)
    }
}

#Preview {
	UserContentListView(user: User.mock)
}
