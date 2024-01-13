//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Firebase


class AuthService {
	
	@Published var userSession: FirebaseAuth.User?
	
	static let shared = AuthService()
	
	init() {
		self.userSession = Auth.auth().currentUser
	}
	
	@MainActor
	func login(withEmail email: String, password: String) async throws {
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
			print(">>> Sign In user \(result.user.uid)")
		} catch {
			print(">>> Failed to sign in user with error \(error.localizedDescription)")
		}
	}
	
	@MainActor
	func createUser(withEmail email: String, password: String, fullname: String, username: String ) async throws {
		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			self.userSession = result.user
			print(">>> Created user \(result.user.uid)")
		} catch {
			print(">>> Failed to create user with error \(error.localizedDescription)")
		}
	}
	
	func signOut() {
		try? Auth.auth().signOut() // signs out on Backend
		self.userSession = nil // this removes session locally and updates routing
	}
}
