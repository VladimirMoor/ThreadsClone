//
//  UserContentListViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 21.01.2024.
//

import Foundation

class UserContentListViewModel: ObservableObject {
	@Published var threads: [Thread] = []
	
	let user: User
	
	init(user: User) {
		self.user = user
		
		Task {
			try await fetchUserThreads()
		}
	}
	
	@MainActor
	func fetchUserThreads() async throws {
		var threads = try await ThreadService.fetchUserThreads(uid: user.id)
		
		threads.indices.forEach { index in
			threads[index].user = self.user
		}
		
		self.threads = threads
	}
	
}
