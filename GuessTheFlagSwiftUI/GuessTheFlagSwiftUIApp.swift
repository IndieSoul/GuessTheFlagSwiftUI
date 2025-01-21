//
//  GuessTheFlagSwiftUIApp.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI

@main
struct GuessTheFlagSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: GameStats.self)
        }
    }
}
