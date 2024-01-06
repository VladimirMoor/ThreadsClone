//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct RegistrationView: View {
	@State private var email = ""
	@State private var password = ""
	@State private var fullname = ""
	@State private var username = ""
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		VStack {
			
			Spacer()
			
			Image(systemName: "umbrella")
				.resizable()
				.scaledToFit()
				.frame(width: 120, height: 120)
				.padding()
			
			
			TextField("Enter your email", text: $email)
				.textInputAutocapitalization(.never)
				.modifier(UmbrellaTextFieldModifier())
			
			SecureField("Enter your password", text: $password)
				.modifier(UmbrellaTextFieldModifier())
			
			TextField("Enter your full name", text: $fullname)
				.modifier(UmbrellaTextFieldModifier())
			
			TextField("Enter your username", text: $username)
				.modifier(UmbrellaTextFieldModifier())
			
			Button {
				
			} label: {
				Text("SignUp")
					.font(.subheadline)
					.fontWeight(.semibold)
					.foregroundStyle(.white)
					.frame(maxWidth: .infinity)
					.frame(height: 44)
					.background(.black)
					.clipShape(RoundedRectangle(cornerRadius: 8))
					.padding(.horizontal, 24)
			}
			.padding(.vertical)
			
			Spacer()
			
			Divider()
			
			Button {
				dismiss()
			} label: {
				HStack(spacing: 3) {
					Text("Alredy have an account?")
					
					Text("Sign In")
						.fontWeight(.semibold)
				}
				.foregroundStyle(.black)
				.font(.footnote)
			}
			.padding(.vertical)

		}
	}
}

#Preview {
	RegistrationView()
}
