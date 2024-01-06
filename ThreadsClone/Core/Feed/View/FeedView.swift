//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
		NavigationStack {
			ScrollView {
				LazyVStack {
					ForEach(0...10, id:\.self) { thread in
						ThreadCell()
					}
				}
			}
			.refreshable {
				print("refresh action here")
			}
			.scrollIndicators(.hidden)
			.navigationTitle("Umbrellas")
			.navigationBarTitleDisplayMode(.inline)
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Button {
					
				} label: {
					Image(systemName: "arrow.counterclockwise")
						.foregroundStyle(Color.black)
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
