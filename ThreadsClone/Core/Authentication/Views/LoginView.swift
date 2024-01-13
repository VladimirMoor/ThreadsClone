//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct LoginView: View {
	
	@StateObject private var viewModel = LoginViewModel()
	
    var body: some View {
		NavigationStack {
			VStack {
				
				Spacer()
				
				Image(systemName: "umbrella")
					.resizable()
					.scaledToFit()
					.frame(width: 120, height: 120)
					.padding()
				
				VStack {
					TextField("Enter your email", text: $viewModel.email)
						.textInputAutocapitalization(.never)
						.modifier(UmbrellaTextFieldModifier())
					
					SecureField("Enter your password", text: $viewModel.password)
						.modifier(UmbrellaTextFieldModifier())
				}
				
				NavigationLink {
					Text("Forgot Password View")
				} label: {
					Text("Forgot Password?")
						.font(.footnote)
						.fontWeight(.semibold)
						.padding(.vertical)
						.padding(.trailing, 28)
						.foregroundStyle(.black)
						.frame(maxWidth: .infinity, alignment: .trailing)
				}
				
				Button {
					Task {
						try await viewModel.login()
					}
				} label: {
					Text("Login")
						.font(.subheadline)
						.fontWeight(.semibold)
						.foregroundStyle(.white)
						.frame(maxWidth: .infinity)
						.frame(height: 44)
						.background(.black)
						.clipShape(RoundedRectangle(cornerRadius: 8))
						.padding(.horizontal)
				}
				
				Spacer()
				
				Divider()
				
				NavigationLink {
					RegistrationView()
						.navigationBarBackButtonHidden()
				} label: {
					HStack(spacing: 3) {
						Text("Don`t have an account?")
						
						Text("Sign Up")
							.fontWeight(.semibold)
					}
					.foregroundStyle(.black)
					.font(.footnote)
				}
				.padding(.vertical)

				
			}
		}
    }
}

#Preview {
    LoginView()
}
