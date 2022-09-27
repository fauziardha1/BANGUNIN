//
//  MainViewModel.swift
//  BANGUNIN
//
//  Created by FauziArda on 27/09/22.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor class ContentViewModel : ObservableObject{
        @Published var isTurnOn : Bool = false
        @Published var counter : Int = 0
        @Published var itemList : [Item] = [Item]()
        
        
        func addCounter()  {
            self.counter += 1
        }
        
        func addItem(){
            let temps = ["hello", "world", "yoomaan","nothing"]
            let item = Item(name: temps.randomElement()!, number: self.counter+1)
            
            withAnimation {
                itemList.insert(item, at: 0)
            }
        }
    }
}
