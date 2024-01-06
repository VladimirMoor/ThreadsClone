//
//  UmbrellaTextFieldModifier.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct UmbrellaTextFieldModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.subheadline)
			.padding(12)
			.background(Color(.systemGray6))
			.clipShape(RoundedRectangle(cornerRadius: 10))
			.padding(.horizontal, 24)
	}
}
