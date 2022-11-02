//
//  UserDefaultAlarm.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import Foundation

@propertyWrapper
struct UserDefaultAlarm<Value: Codable> {var wrappedValue: Value
  let key: String
  let defaultValue: Value
  
  var value: Value {
    get {
      let data = UserDefaults.standard.data(forKey: key)
      let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
      return value ?? defaultValue
    }
    set {
      let data = try? JSONEncoder().encode(newValue)
      UserDefaults.standard.set(data, forKey: key)
    }
  }
}
