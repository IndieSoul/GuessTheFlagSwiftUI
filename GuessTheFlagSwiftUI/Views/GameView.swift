//
//  GuessTheFlagSwiftUIApp.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .gray]), center: .center, startRadius: 5, endRadius: 500)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Guess the Flag")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundColor(.white)
                                .font(.subheadline.weight(.semibold))
                            
                            Text(viewModel.countries[viewModel.correctAnswer])
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.black)
                        }
                        .padding(.bottom)
                        
                        ForEach(0..<3) { number in
                            Button(action: {
                                viewModel.flagTapped(number)
                            }) {
                                Image(viewModel.countries[number])
                                    .clipShape(Capsule())
                                    .shadow(color: .black, radius: 5)
                                    .opacity(viewModel.showingScore && number != viewModel.correctAnswer ? 0.3 : 1.0)
                                    .rotation3DEffect(.degrees(viewModel.animationAmount), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(viewModel.showingScore && number != viewModel.correctAnswer ? 0.8 : 1)
                                    .animation(.easeIn, value: viewModel.showingScore)
                            }
                            .accessibilityLabel(viewModel.labels[viewModel.countries[number], default: "Unknown flag"])
                        }
                        
                        Text("Answer \(viewModel.totalAnswers) of 8")
                            .foregroundStyle(.white)
                            .font(.footnote)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    Text("Score: \(appViewModel.score)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    Button("RESTART GAME") {
                        viewModel.resetGame()
                        appViewModel.resetScore()
                    }
                    .foregroundStyle(.white)
                    .buttonStyle(.bordered)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .alert(viewModel.scoreTitle, isPresented: $viewModel.showingScore) {
            Button("Continue", action: viewModel.askQuestion)
        } message: {
            Text(viewModel.scoreMessage)
        }
        .onAppear {
            // Configura los cierres al aparecer la vista
            viewModel.onCorrectAnswer = {
                appViewModel.incrementScore(by: 1) // Incrementa el puntaje
            }
            viewModel.onWrongAnswer = {
                appViewModel.incrementScore(by: -1) // Reduce el puntaje
            }
            viewModel.onGameFinished = {
                appViewModel.navigate(to: .statsView) // Navega a StatsView
            }
        }
    }
}

#Preview {
    GameView()
        .environmentObject(AppViewModel())
}
