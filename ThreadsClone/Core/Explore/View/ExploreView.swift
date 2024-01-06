//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct ExploreView: View {
	@State private var searchText = ""
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack {
					ForEach(0...40, id: \.self) { user in
						VStack {
							UserCell()
							Divider()
						}
						.padding(.vertical, 4)
					}
				}
			}
			.navigationTitle("Search")
			.searchable(text: $searchText, prompt: "Search")
		}
    }
}

#Preview {
    ExploreView()
}
