//
//  BANGUNINApp.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI

@main
struct BANGUNINApp: App {
//    @StateObject private var coreDM = CoreDataManager()
    @StateObject var router = TabRouter()
    
    var body: some Scene {
//        
        WindowGroup {
            customTabBar(router: TabRouter())
//                .environment(\.managedObjectContext, coreDM.persistentContainer.viewContext)
        }
    }
}
