//
//  AlarmModel.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import SwiftUI

struct AlarmModel: Hashable, Codable, Identifiable {
    let id: UUID
    var date: Date
    var label: String
    var repeatDay: [Int]
    var isActive: Bool
    var isSnooze: Bool
    
    //repeat day string
    var repeats: String {
      guard repeatDay.count > 0 else { return "" }
        return repeatDay.repeats
    }
//
    init(date: Date, label: String, repeatDay: [RepeatDay], isActive: Bool, isSnooze: Bool) {
      self.id = UUID()
      self.date = date
      self.label = label
      self.repeatDay = repeatDay.map { $0.rawValue }
      self.isActive = isActive
      self.isSnooze = isSnooze
    }
    
    // Default Alarms
    static var defaultAlarm: [AlarmModel] {
      get {
        [
          AlarmModel(date: Date().addingTimeInterval(-1000), label: "Alarm", repeatDay: [.sunday], isActive: true, isSnooze: true),
          AlarmModel(date: Date(), label: "Alarm", repeatDay: [.sunday, .monday], isActive: true, isSnooze: false),
          AlarmModel(date: Date().addingTimeInterval(+1000), label: "Alarm", repeatDay: [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturday], isActive: false, isSnooze: false)
        ]
      }
    }
}




