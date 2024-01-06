//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 06.01.2024.
//

import SwiftUI

struct ThreadCell: View {
	var body: some View {
		VStack {
			HStack(alignment: .top, spacing: 12) {
				CircularProfileImageView()
				
				VStack(alignment: .leading, spacing: 4) {
					HStack {
						Text("HumanOne")
							.font(.footnote)
							.fontWeight(.semibold)
						
						Spacer()
						
						Text("10m")
							.font(.caption)
							.foregroundStyle(Color(.systemGray3))
						
						Button {
							
						} label: {
							Image(systemName: "ellipsis")
								.foregroundStyle(Color(.darkGray))
						}
					}
					
					Text("There was a time When I was so broken-hearted Love wasn't much of a friend of mine The tables have turned, yeah 'Cause me and them ways have parted That kind of love was the killin' kind")
						.font(.footnote)
						.multilineTextAlignment(.leading)
					
					
					HStack(spacing: 16) {
						Button {
							
						} label: {
							Image(systemName: "heart")
						}
						
						Button {
							
						} label: {
							Image(systemName: "bubble.right")
						}
						
						Button {
							
						} label: {
							Image(systemName: "arrow.rectanglepath")
						}
						
						Button {
							
						} label: {
							Image(systemName: "paperplane")
						}
					}
					.foregroundStyle(.black)
					.padding(.vertical, 8)
				}
			}
			
			Divider()
		}
		.padding()
	}
}

#Preview {
    ThreadCell()
}
