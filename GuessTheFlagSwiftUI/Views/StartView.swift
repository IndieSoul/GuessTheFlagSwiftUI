//
//  StartView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        VStack {
            Text("Welcome to Guess the Flag!")
                .font(.largeTitle)
                .padding()
            Text("Test your knowledge of world flags!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
            Button("Start Game") {
                // Navegar al juego
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    StartView()
}
