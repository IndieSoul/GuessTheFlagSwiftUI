//
//  GameViewModel.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @Published var correctAnswer = Int.random(in: 0...2)
    
    @Published var showingScore = false
    @Published var scoreTitle = ""
    @Published var scoreMessage = ""
    
    @Published var totalAnswers = 0
    @Published var animationAmount = 0.0
    
    // Cierres opcionales
    var onCorrectAnswer: (() -> Void)?
    var onWrongAnswer: (() -> Void)?
    var onGameFinished: (() -> Void)?
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]
    
    func flagTapped(_ number: Int) {
        if totalAnswers >= 8 { return } // Prevenir acciones después de que termine el juego
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreMessage = "Good job!"
            onCorrectAnswer?()
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That was \(countries[number])."
            onWrongAnswer?()
        }
        
        totalAnswers += 1

        // Verificar si el juego ha terminado
        if totalAnswers >= 8 {
            scoreTitle = "Game Finished"
            onGameFinished?() // Llamar al cierre para navegar a StatsView
            return
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        withAnimation {
            animationAmount += 360
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        totalAnswers = 0
        askQuestion()
    }
}
