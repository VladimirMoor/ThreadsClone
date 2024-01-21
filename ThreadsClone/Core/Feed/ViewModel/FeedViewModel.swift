//
//  FeedViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 21.01.2024.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
	@Published var threads = [Thread]()
	
	init() {
		Task {
			try await fetchThreads()
		}
	}
	
	func fetchThreads() async throws {
		threads = try await ThreadService.fetchThreads()
		fetchUserDataForThread()
	}
	
	private func fetchUserDataForThread() {
		threads.indices.forEach { index in
			Task {
				let ownerUid = threads[index].ownerUid
				threads[index].user = try await UserService.fetchUser(withUid: ownerUid)
			}
		}
	}
}
