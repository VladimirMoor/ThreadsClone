//
//  UserCell.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
		HStack {
			CircularProfileImageView()
			
			VStack(alignment: .leading) {
				Text("jes 1443")
					.fontWeight(.semibold)
				
				Text("Jesica Bronelly")
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
    UserCell()
}
