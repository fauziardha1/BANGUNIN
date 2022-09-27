//
//  Item.swift
//  BANGUNIN
//
//  Created by FauziArda on 27/09/22.
//

import Foundation


struct Item : Identifiable, Codable{
    var id : UUID = UUID()
    var name : String
    var number : Int
    
    static var item = Item(name: "Name", number: 0)
}
