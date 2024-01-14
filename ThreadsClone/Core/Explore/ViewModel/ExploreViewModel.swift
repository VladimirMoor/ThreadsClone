//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 14.01.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
	@Published var users: [User] = []
	
	init() {
		Task {
			try await fetchUsers()
		}
	}
	
	@MainActor
	private func fetchUsers() async throws {
		users = try await UserService.fetchUsers()
	}
}
