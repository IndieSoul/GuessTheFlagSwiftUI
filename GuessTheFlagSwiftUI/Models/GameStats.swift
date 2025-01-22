//
//  GameStats.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import Foundation

class GameStats {
    var id: UUID
    var totalScore: Int
    
    init(id: UUID = UUID(), totalScore: Int = 0, gamesPlayed: Int = 0) {
        self.id = id
        self.totalScore = totalScore
    }
}
