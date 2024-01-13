//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
	@Published var email = ""
	@Published var password = ""
	
	@MainActor
	func login() async throws {
		try await AuthService.shared.login(withEmail: email, password: password)
	}
}
