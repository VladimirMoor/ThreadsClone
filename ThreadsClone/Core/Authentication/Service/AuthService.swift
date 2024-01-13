//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Firebase


class AuthService {
	
	static let shared = AuthService()
	
	@MainActor
	func login(withEmail email: String, password: String) async throws {
		
	}
	
	@MainActor
	func createUser(withEmail email: String, password: String, fullname: String, username: String ) async throws {
		do {
			let result = try await Auth.auth().createUser(withEmail: email, password: password)
			print(">>> Created user \(result.user.uid)")
		} catch {
			print(">>> Failed to create user with error \(error.localizedDescription)")
		}
	}
}
