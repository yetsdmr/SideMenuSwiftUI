//
//  SideMenuSwiftUIApp.swift
//  SideMenuSwiftUI
//
//  Created by Yunus Emre Taşdemir on 18.04.2023.
//

import SwiftUI

@main
struct SideMenuSwiftUIApp: App {
    @StateObject var viewModel : ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
