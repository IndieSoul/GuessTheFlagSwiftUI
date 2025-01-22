//
//  RecordsView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

//
//  RecordsView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

struct RecordsView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .gray]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Spacer()
                Text("Records")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Best Score: \(appViewModel.bestScore)")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Back to Start") {
                    appViewModel.resetNavigation()
                }
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
            }
            .padding()
        }
    }
}

#Preview {
    RecordsView()
        .environmentObject(AppViewModel())
}
