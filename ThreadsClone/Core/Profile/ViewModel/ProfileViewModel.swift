//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
	
	@Published var currentUser: User?
	private var cancellables = Set<AnyCancellable>()
	init() {
		setupSubscribers()
	}
	
	private func setupSubscribers() {
		UserService.shared.$currentUser.sink { [weak self] user in
			self?.currentUser = user
			print(">>> currentUser in ViewModel:", user ?? "")
		}
		.store(in: &cancellables)
	}
}
