//
//  CustomSlider.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 18/11/22.
//

import SwiftUI

struct CustomSlider: View {
    
//    @State var currentVibration = 5.0
    @ObservedObject var vibrationname: DataSave
    
    var body: some View {
        VStack {
            HStack {
                
                Slider(value: $vibrationname.Vibration, in: 0.0 ... 10.0)
                    .frame(width: 300)
                    .accentColor(Color("primary"))
                    .padding()
            }
            .padding()
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(vibrationname: DataSave())
    }
}
