//
//  ViewModel.swift
//  SideMenuSwiftUI
//
//  Created by Yunus Emre Taşdemir on 18.04.2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var isOpen: Bool = false
    @Published var sideButton: Bool = true
    @Published var selectedItem: TabIcon = .home
    @Published var toogleAction: Bool = false
}

struct sideBar: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var tab: TabIcon
}

var sidebar = [
    sideBar(icon: "rectangle.stack", title: "Tutoriols", tab: .home),
    sideBar(icon: "star", title: "Favorite", tab: .maginf),
    sideBar(icon: "square.and.arrow.down", title: "Downloads", tab: .bell),
    sideBar(icon: "ellipsis.message", title: "Message", tab: .rect)
]

enum TabIcon: String {
    case home
    case maginf
    case bell
    case rect
}

struct Colors: Identifiable {
    var id = UUID()
    var acolors: Color
}

var arrayColor = [
    Colors(acolors: .indigo),
    Colors(acolors: .pink),
    Colors(acolors: .secondary)
]

struct Projects: Identifiable {
    var id = UUID()
    var color: Color
    var title: String
}

var arrayProjects = [
    Projects(color: .red, title: "TabBr"),
    Projects(color: .purple, title: "api jeston"),
    Projects(color: .yellow, title: "side bar"),
    Projects(color: .blue, title: "todo app"),
    Projects(color: .cyan, title: "video editor")
]
