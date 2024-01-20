//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 18.01.2024.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
	static func uploadImage(_ image: UIImage) async throws -> String? {
		guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
		let filename = UUID().uuidString
		let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
		
		do {
			let _ = try await storageRef.putDataAsync(imageData)
			let url = try await storageRef.downloadURL()
			return url.absoluteString
		} catch {
			print("Failed to uplad image with error: \(error.localizedDescription)")
			return nil
		}
	}
}
