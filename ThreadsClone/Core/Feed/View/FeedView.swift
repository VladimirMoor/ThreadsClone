//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct FeedView: View {
	@StateObject var viewModel = FeedViewModel()
	
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack {
					ForEach(viewModel.threads) { thread in
						ThreadCell(thread: thread)
					}
				}
			}
			.refreshable {
				Task {
					try await viewModel.fetchThreads()
				}
			}
			.scrollIndicators(.hidden)
			.navigationTitle("Umbrellas")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {
						Task {
							try await viewModel.fetchThreads()
						}
					} label: {
						Image(systemName: "arrow.counterclockwise")
							.foregroundStyle(Color.black)
					}
				}
			}
		}
    }
}

#Preview {
	NavigationStack {
		FeedView()
	}
}
