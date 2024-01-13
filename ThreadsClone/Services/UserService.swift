//
//  UserService.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
	@Published var currentUser: User?
	
	static let shared = UserService()
	
	init() {
		Task {
			try await fetchCurrentUser()
		}
	}
	
	@MainActor
	func fetchCurrentUser() async throws {
		do {
			guard let uid = Auth.auth().currentUser?.uid else { return }
			let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
			let user = try snapshot.data(as: User.self)
			self.currentUser = user
			
			print(">>> user is ", user)
		} catch {
			print(">>> error fetching user from Firebase:", error.localizedDescription)
		}
	}
	
	
	func reset() {
		currentUser = nil
	}
}
