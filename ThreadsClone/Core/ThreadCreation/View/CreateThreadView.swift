//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct CreateThreadView: View {
	@StateObject var viewModel = CreateThreadViewModel()
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		NavigationStack {
			VStack {
				HStack(alignment: .top) {
					CircularProfileImageView(user: viewModel.user)
					
					VStack(alignment: .leading, spacing: 4) {
						Text(viewModel.user?.username ?? "")
							.fontWeight(.semibold)
						
						TextField("Start a thred...", text: $viewModel.caption, axis: .vertical)
					}
					.font(.footnote)
					
					Spacer()
					
					if !viewModel.caption.isEmpty {
						Button {
							viewModel.caption = ""
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
						Task {
							try await viewModel.uploadThread()
							dismiss()
						}
					}
					.opacity(viewModel.caption.isEmpty ? 0.5 : 1.0)
					.disabled(viewModel.caption.isEmpty)
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
