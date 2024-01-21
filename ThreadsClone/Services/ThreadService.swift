//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 20.01.2024.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
	
	static func uploadThread(_ thread: Thread) async throws {
		guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
		try await Firestore.firestore().collection("threads").addDocument(data: threadData)
	}
}
