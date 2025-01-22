//
//  StartView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .gray]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Welcome to Guess the Flag!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                
                Text("Test your knowledge of world flags!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                Button("Start Game") {
                    appViewModel.navigate(to: .gameView)
                }
                .foregroundStyle(.white)
                .buttonStyle(.bordered)
                Button("Records") {
                    appViewModel.navigate(to: .recordsView)
                }
                .foregroundStyle(.white)
                .buttonStyle(.bordered)
            }
        }
        
    }
}

#Preview {
    StartView()
        .environmentObject(AppViewModel())
}
