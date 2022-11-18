//
//  BANGUNINApp.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI

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
