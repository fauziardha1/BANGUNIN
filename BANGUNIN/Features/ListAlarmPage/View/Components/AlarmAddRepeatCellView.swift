//
//  AlarmAddRepeatCellView.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import SwiftUI

struct AlarmAddRepeatCellView : View {
  @Binding var repeatDay: [RepeatDay]
  
  var body: some View {
    NavigationButton(destination: AlarmRepeatView(repeatDay: $repeatDay)){
      HStack {
        Text("Repeat")
        Spacer()
        if $repeatDay.count == 0 {
          Text("Never")
        } else {
          Text(repeatDay.repeats)
        }
      }
    }
  }
}

