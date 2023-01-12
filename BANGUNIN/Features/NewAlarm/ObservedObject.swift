//
//  ObservedObject.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 08/12/22.
//

import Foundation

class DataSave: ObservableObject
{
    @Published var AlertSound: String = ""
    @Published var Vibration: Float = 1.0
    @Published var RepeatSound: String = ""
    

}
