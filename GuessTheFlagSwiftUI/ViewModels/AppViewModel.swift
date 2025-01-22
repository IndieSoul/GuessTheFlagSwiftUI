//
//  AppViewModel.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

class AppViewModel: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var score: Int = 0
    @Published var bestScore: Int = 0 {
        didSet {
            saveBestScore()
        }
    }
    
    init() {
        loadBestScore()
    }
    
    func resetApp() {
        path = NavigationPath()
        score = 0
        bestScore = 0
    }
    
    func incrementScore(by value: Int) {
        score += value
    }
    
    func resetScore() {
        score = 0
    }
    
    func updateBestScore() {
        if score > bestScore {
            bestScore = score
            saveBestScore()
        }
    }
    
    func navigate(to destination: NavigationDestinations) {
        path.append(destination)
    }
    
    func resetNavigation() {
        path = NavigationPath()
    }
    
    // MARK: - UserDefaults Persistence
    
    private let bestScoreKey = "bestScoreKey"
    
    private func saveBestScore() {
        UserDefaults.standard.set(bestScore, forKey: bestScoreKey)
    }
    
    private func loadBestScore() {
        bestScore = UserDefaults.standard.integer(forKey: bestScoreKey)
    }
}
