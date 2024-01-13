//
//  User.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 13.01.2024.
//

import Foundation

struct User: Identifiable, Codable {
	let id: String
	let fullname: String
	let email: String
	let username: String
	var profileImageURL: String?
	var bio: String?
}
