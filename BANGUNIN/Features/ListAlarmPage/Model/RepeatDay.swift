//
//  RepeatDay.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import Foundation

enum RepeatDay: Int {
  case sunday = 0
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  case saturday
  
  var fullName: String {
    switch self {
    case .sunday: return "Sunday"
    case .monday: return "Monday"
    case .tuesday: return "Tuesday"
    case .wednesday: return "Wednesday"
    case .thursday: return "Thursday"
    case .friday: return "Friday"
    case .saturday: return "Saturday"
    }
  }
  
  var shortName: String {
    switch self {
    case .sunday: return "Sun"
    case .monday: return "Mon"
    case .tuesday: return "Tue"
    case .wednesday: return "Wed"
    case .thursday: return "Thu"
    case .friday: return "Fri"
    case .saturday: return "Sat"
    }
  }

}
