//
//  GuessTheFlagSwiftUIApp.swift
//  GuessTheFlagSwiftUI
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI

@main
struct GuessTheFlagSwiftUIApp: App {
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appViewModel.path) {
                StartView()
                    .configureNavigationDestinations()
            }
            .environmentObject(appViewModel)
        }
    }
}
