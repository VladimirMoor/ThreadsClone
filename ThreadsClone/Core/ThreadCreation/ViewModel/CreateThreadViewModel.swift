//
//  CreateThreadViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 20.01.2024.
//

import Firebase
import Combine

class CreateThreadViewModel: ObservableObject {
	@Published var caption = ""
	@Published var user: User?
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		setupSubscribers()
	}
	
	func uploadThread() async throws {
		guard let uid = Auth.auth().currentUser?.uid else { return }
		let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
		try await ThreadService.uploadThread(thread)
	}
	
	private func setupSubscribers() {
		UserService.shared.$currentUser.sink { [weak self] user in
			self?.user = user
		}
		.store(in: &cancellables)
	}
	
}


//@Published var currentUser: User?
//private var cancellables = Set<AnyCancellable>()
//init() {
//	setupSubscribers()
//}
//
//private func setupSubscribers() {
//	UserService.shared.$currentUser.sink { [weak self] user in
//		self?.currentUser = user
//	}
//	.store(in: &cancellables)
//}
