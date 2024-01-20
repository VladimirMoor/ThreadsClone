//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI

struct UserCell: View {
	let user: User
    var body: some View {
		HStack {
			CircularProfileImageView(user: user)
			
			VStack(alignment: .leading, spacing: 2) {
				Text(user.username)
					.fontWeight(.semibold)
				
				Text(user.fullname)
			}
			.font(.footnote)
			
			Spacer()
			
			Button {
				
			} label: {
				Text("Follow")
					.font(.subheadline)
					.fontWeight(.semibold)
			}
			.buttonStyle(.bordered)
			.controlSize(.regular)
			.tint(.black)
		}
		.padding(.horizontal)

    }
}

#Preview {
	UserCell(user: User.mock)
}
