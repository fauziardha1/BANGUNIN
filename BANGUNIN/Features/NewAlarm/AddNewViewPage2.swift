//
//  AddNewViewPage2.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 17/11/22.
//

import SwiftUI

struct AddNewViewPage2: View {
    @State var num = 2
    @State private var alarmName: String = ""
    @State private var selectedColor: Color = .accentColor
    
    @State private var selectedSound: String = "Choose Sound"
    
    @State var pick: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Alarm Color (\(num)/2)")
                        .font(.callout)
                        .bold()
                    
                    CustomColor(selectedColor: $selectedColor)
//                    Text("\(selectedColor.description)")
                }
                
                VStack(alignment: .leading) {
                    Text("Alert Sound")
                        .font(.callout)
                        .bold()
                    CustomDropDown()
                }
                
                VStack(alignment: .leading) {
                    Text("Vibration")
                        .font(.callout)
                        .bold()
                    CustomDropDown()
                }
                
                VStack(alignment: .leading) {
                    Text("Repeat")
                        .font(.callout)
                        .bold()
                    CustomDropDown()
                }

                Spacer()
                
//                NavigationLink(destination: AddNewViewPage2()) {
                    Button(action: {
                        self.num = 2
                        
                    } , label: {
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(Color("bg"))
                            .padding(.vertical, 17)
                            .padding(.horizontal, 150)
                            .background(Color("primary"))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                    }).padding(.top)
//                }
                
                
//                Text(String(num))
            }.navigationTitle("Stasiun Gambir")
                .padding()
//                .background(Color("bg"))
        }
        
    }

}

struct AddNewViewPage2_Previews: PreviewProvider {
    static var previews: some View {
        AddNewViewPage2()
    }
}
