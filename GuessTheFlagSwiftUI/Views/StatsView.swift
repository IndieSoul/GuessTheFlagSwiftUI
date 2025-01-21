//
//  StatsView.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI
import SwiftData

struct StatsView: View {
    @Query var stats: [GameStats]
    
    var body: some View {
        VStack {
            Text("Your Statistics")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Total Score: \(stats.first?.totalScore ?? 0)")
            Text("Games Played: \(stats.first?.gamesPlayed ?? 0)")
        }
        .padding()
    }
}

#Preview {
    StatsView()
}
