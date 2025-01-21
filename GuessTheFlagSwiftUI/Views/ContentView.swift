//
//  GuessTheFlagSwiftUIApp.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var score = 0
    @State private var totalAnswers = 0
    
    @State private var animationAmount = 0.0
    
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
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .gray]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap to flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.semibold))
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    .padding(.bottom)
                    
                    ForEach(0..<3) { number in
                        Button(action: {
                            flagTapped(number)
                        }) {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(color: .black, radius: 5)
                                .opacity(showingScore && number != correctAnswer ? 0.3 : 1.0)
                                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                                .scaleEffect(showingScore && number != correctAnswer ? 0.8 : 1)
                                .animation(.easeIn, value: 0)
                            
                        }
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                    Text("Answer \(totalAnswers) of 8")
                        .foregroundStyle(.white)
                        .font(.footnote)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial.opacity(0.4))
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Text("Score: \(score)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                Button("RESTAR GAME") {
                    totalAnswers = 0
                    score = 0
                    askQuestion()
                }
                .foregroundStyle(.white)
                .buttonStyle(.bordered)
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
    }
    
    func flagTapped(_ number: Int) {
        if totalAnswers > 7 { return }
        
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
            scoreMessage = "Your score is \(score)"
            
        } else {
            score -= 1
            scoreTitle = "Wrong"
            scoreMessage = "You choose \(countries[number])\nYour score is \(score)"
            
        }
        totalAnswers += 1
        
        if totalAnswers > 7 {
            scoreTitle = "Game Finished"
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
}

#Preview {
    ContentView()
}
