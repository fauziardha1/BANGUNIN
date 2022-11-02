//
//  AlarmLabelView.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 02/11/22.
//

import SwiftUI

struct AlarmLabelView : View {
  @Binding var label: String
  
  var body: some View {
      TextField($label)
      .textFieldStyle(.roundedBorder)
      .navigationBarTitle(Text("Label"), displayMode: .inline)
  }
}
