//
//  Thread.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 20.01.2024.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
	@DocumentID var threadId: String?
	let ownerUid: String
	let caption: String
	let timestamp: Timestamp
	var likes: Int
	
	var id: String {
		return threadId ?? UUID().uuidString
	}
	
	var user: User?
	
	static let mock = Thread(ownerUid: "000", caption: "Mock thread here", timestamp: Timestamp(), likes: 3)
}
