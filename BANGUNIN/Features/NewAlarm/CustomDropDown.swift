//
//  CustomDropDown.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 18/11/22.
//

import SwiftUI

struct CustomDropDown: View {
    @State var expand = false
    
    @State var defaultSound = "Choose Sound"
    let alarmSound : [String] = ["ringtone one", "ringtone two", "ringtone three"]
    
    var body: some View {
        VStack (alignment: .leading, content: {
            HStack {
                Text("\(defaultSound)")
                    .fontWeight(.bold)
                    .font(.callout)
                    .foregroundColor(expand ? Color("bg") : Color.black)
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                    .resizable()
                    .frame(width: 14, height: 6)
                    .foregroundColor(expand ? Color("bg") : Color.black)
            }
            .onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                
                ForEach(alarmSound, id: \.self) { alarmsound in
                    Button(action: {
                        defaultSound = alarmsound
                        self.expand.toggle()
                    }) {
                        
                        Text("\(alarmsound)")
                            .padding()
                            .fontWeight(.bold)
                            .foregroundColor(Color("bg"))
                            .font(.callout)
                        
                    }.foregroundColor(.black)
                }
                
                
            }
        })
//        .frame(height: expand ? 500 : 100)
        .padding(.vertical, 18)
        .padding(.horizontal, 110)
        .background(expand ? Color("primary") : Color("bg"))
        .cornerRadius(25)
        .overlay(RoundedRectangle(cornerRadius: 25)
            .stroke(expand ? Color("primary"): .gray))
        .opacity(expand ? 1.0 : 0.5)
        .animation(.spring())
    }
}

struct CustomDropDown_Previews: PreviewProvider {
    static var previews: some View {
        CustomDropDown()
    }
}


