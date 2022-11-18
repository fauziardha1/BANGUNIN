//
//  CustomColor.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 18/11/22.
//

import SwiftUI

struct CustomColor: View {
    @Binding var selectedColor: Color
    let alarmColors: [Color] = [.blue, .green, .orange, .yellow]
    
    var body: some View {
        HStack {
            ForEach(alarmColors, id: \.self) { alarmcolor in
//                VStack(spacing: 10) {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(alarmcolor)
                        .frame(width: 70, height: 45)
                        .opacity(alarmcolor == selectedColor ? 1.0 : 0.5)
                        .scaleEffect(alarmcolor == selectedColor ? 1.1 : 1.0)
                        .onTapGesture {
                            selectedColor = alarmcolor
                            
                        }

//                }
            }
        }
        .padding()
        .background(Color("bg"))
        .cornerRadius(25)
        .padding(.horizontal)
    }
}

struct CustomColor_Previews: PreviewProvider {
    static var previews: some View {
        CustomColor(selectedColor: .constant(.blue))
    }
}
