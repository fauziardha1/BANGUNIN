//
//  AlarmAddLabelCellView.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import SwiftUI

struct AlarmAddLabelCellView : View {
  @Binding var label: String
  
  var body: some View {
    NavigationButton(destination: AlarmLabelView(label: $label)){
      HStack {
        Text("Label")
        Spacer()
        Text(label)
      }
    }
  }
}

