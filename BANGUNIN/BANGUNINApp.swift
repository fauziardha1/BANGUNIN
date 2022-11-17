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
    case addAlarmPage
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
    
    var body: some Scene {
//        
        WindowGroup {
            customTabBar(router: TabRouter())
        }
    }
}
