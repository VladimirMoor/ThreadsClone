//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Владимир Муравьев on 04.01.2024.
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var viewModel = ContentViewModel()
	
    var body: some View {
		Group {
			if viewModel.userSession != nil {
				UmbrellaTabView()
			} else {
				LoginView()
			}
		}
    }
}

#Preview {
    ContentView()
}
