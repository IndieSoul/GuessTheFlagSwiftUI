//
//  NavigationDestinations.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 21/01/25.
//

import SwiftUI

enum NavigationDestinations: String, CaseIterable, Hashable {
    case startGame
    case gameView
    case statsView
    case recordsView
}

extension View {
    func configureNavigationDestinations() -> some View {
        self.navigationDestination(for: NavigationDestinations.self) { destination in
            switch destination {
            case .startGame:
                StartView()
            case .gameView:
                GameView()
                    .navigationBarBackButtonHidden()
            case .statsView:
                StatsView()
                    .navigationBarBackButtonHidden()
            case .recordsView:
                RecordsView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
