//
//  TabBarRouter.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 18/11/22.
//

import Foundation

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
