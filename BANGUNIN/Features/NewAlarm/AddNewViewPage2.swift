//
//  AddNewViewPage2.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 17/11/22.
//

import SwiftUI

struct AddNewViewPage2: View {
    @Environment(\.dismiss) var dismiss
    @State var num = 2
    @State private var alarmName: String = ""
    @State private var selectedColor: Color = .accentColor
    
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
                    CustomSlider()
                }
                
                VStack(alignment: .leading) {
                    Text("Repeat")
                        .font(.callout)
                        .bold()
                    CustomDropDown()
                }

                Spacer()

                Button(action: {
                    self.num = 2
                    
                } , label: {
                    Text("Save")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bg"))
                        .padding(.vertical, 17)
                        .padding(.horizontal, 150)
                        .background(Color("primary"))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                }).padding(.top)
                
                    Text("Back")
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 17)
                        .padding(.horizontal, 150)
                        .background(Color("bg"))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .onTapGesture {
                            dismiss()
                        }
                
                
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
