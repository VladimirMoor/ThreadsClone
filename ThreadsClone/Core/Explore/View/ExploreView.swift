//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct ExploreView: View {
	@State private var searchText = ""
	@StateObject var viewModel = ExploreViewModel()
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack {
					ForEach(viewModel.users) { user in
						NavigationLink(value: user) {
							VStack {
								UserCell(user: user)
								Divider()
							}
							.padding(.vertical, 4)
						}
					}
				}
			}
			.navigationTitle("Search")
			.searchable(text: $searchText, prompt: "Search")
			.navigationDestination(for: User.self) { user in
				ProfileView(user: user)
			}
		}
    }
}

#Preview {
    ExploreView()
}
