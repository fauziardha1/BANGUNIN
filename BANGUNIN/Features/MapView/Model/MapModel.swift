//
//  MapModel.swift
//  BANGUNIN
//
//  Created by FauziArda on 30/09/22.
//

import Foundation
struct Location : Identifiable{
    var id : UUID = UUID()
    var name : String
    var latitude : Double
    var longitude : Double
    
    static var location = Location(name: "default", latitude: 51.5, longitude: -0.12)
}
