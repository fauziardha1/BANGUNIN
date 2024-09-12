//
//  TabRouter.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/11/22.
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
