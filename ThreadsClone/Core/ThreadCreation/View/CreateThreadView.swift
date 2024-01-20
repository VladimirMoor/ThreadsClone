//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct CreateThreadView: View {
	@State private var caption = ""
	@Environment(\.dismiss) var dismiss
    var body: some View {
		NavigationStack {
			VStack {
				HStack(alignment: .top) {
					CircularProfileImageView(user: nil)
					
					VStack(alignment: .leading, spacing: 4) {
						Text("janise_official44")
							.fontWeight(.semibold)
						
						TextField("Start a thred...", text: $caption, axis: .vertical)
					}
					.font(.footnote)
					
					Spacer()
					
					if !caption.isEmpty {
						Button {
							caption = ""
						} label: {
							Image(systemName: "xmark")
								.font(.system(size: 16))
								.foregroundStyle(.gray)
						}
					}
				}
				
				Spacer()
			}
			.padding()
			.navigationTitle("New Thread")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					Button("Cancel") {
						dismiss()
					}
					.font(.subheadline)
					.foregroundStyle(.black)
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					Button("Post") {
						
					}
					.opacity(caption.isEmpty ? 0.5 : 1.0)
					.disabled(caption.isEmpty)
					.font(.subheadline)
					.fontWeight(.semibold)
					.foregroundStyle(.black)
				}
			}
		}
    }
}

#Preview {
	NavigationStack {
		CreateThreadView()
	}
}
