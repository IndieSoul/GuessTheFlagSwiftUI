//
//  GameStats.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftData
import Foundation

@Model
class GameStats {
    @Attribute(.unique) var id: UUID
    var totalScore: Int
    var gamesPlayed: Int
    
    init(id: UUID = UUID(), totalScore: Int = 0, gamesPlayed: Int = 0) {
        self.id = id
        self.totalScore = totalScore
        self.gamesPlayed = gamesPlayed
    }
}
