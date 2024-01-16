//
//  UmbrellaTabView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct UmbrellaTabView: View {
	@State private var selectedTab = 0
	@State private var showCreateThread = false
	@State private var oldValueSelectedTab = 0
    var body: some View {
		TabView(selection: $selectedTab) {
			FeedView()
				.tabItem {
					Image(systemName: selectedTab == 0 ? "house.fill" : "house")
						.environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
				}
				.tag(0)
			
			ExploreView()
				.tabItem {
					Image(systemName: "magnifyingglass")
				}
				.tag(1)
			
			Color.clear
				.tabItem {
					Image(systemName: "plus")
				}
				.tag(2)
			
			ActivityView()
				.tabItem {
					Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
						.environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
				}
				.tag(3)
			
			CurrentUserProfileView()
				.tabItem {
					Image(systemName: selectedTab == 4 ? "person.fill" : "person")
						.environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
				}
				.tag(4)
		}
		.onChange(of: selectedTab, { oldValue, newValue in
			showCreateThread = (newValue == 2)
			oldValueSelectedTab = oldValue
		})
		.sheet(isPresented: $showCreateThread, onDismiss: {
			selectedTab = oldValueSelectedTab
		}, content: {
			CreateThreadView()
		})
		.tint(.black)
    }
}

#Preview {
	NavigationStack {
		UmbrellaTabView()
	}
}
