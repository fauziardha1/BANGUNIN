//
//  AlarmAddSnoozeCellView.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import SwiftUI

struct AlarmAddSnoozeCellView : View {
  @Binding var isSnoozed: Bool
  
  var body: some View {
    Toggle(isOn: $isSnoozed) {
      Text("Snooze")
    }
  }
}

