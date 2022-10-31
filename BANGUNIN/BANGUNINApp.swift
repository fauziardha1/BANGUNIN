//
//  BANGUNINApp.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI

enum Screen {
    case homepage
    case listpage
}

final class TabRouter: ObservableObject {
    @Published var screen: Screen = .homepage
    
    func change(to screen: Screen) {
        self.screen = screen
    }
}

@main
struct BANGUNINApp: App {
    
    @StateObject var router = TabRouter()
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $router.screen) {
                MapPage()
                    .tag(Screen.homepage)
                    .environmentObject(router)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                ListPage()
                    .tag(Screen.listpage)
                    .environmentObject(router)
                    .tabItem {
                        Label("List", systemImage: "bookmark")
                    }
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }.accentColor(.orange)
        }
    }
}
