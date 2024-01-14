//
//  User.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
	let id: String
	let fullname: String
	let email: String
	let username: String
	var profileImageURL: String?
	var bio: String?
	
	static let mock = User(id: "123", fullname: "Jesica Browen", email: "jess@gmail.com", username: "jess_here")
}
