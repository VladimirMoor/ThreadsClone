//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 15.01.2024.
//

import SwiftUI

struct UserContentListView: View {
	
	@State private var selectedFilter: ProfileThreadFilter = .threads
	@Namespace private var animation
	
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
				ForEach(0...40, id:\.self) { thread in
//					ThreadCell()
				}
			}
			
		}
		.padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView()
}
