//
//  AddNewViewPage2.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 17/11/22.
//

import SwiftUI

struct AddNewViewPage2: View {
    
    let coreDM: CoreDataManager
    @State public var alarms: [DataAlarm] = [DataAlarm]()
    
    let data: UserData
    
    @Environment(\.dismiss) var dismiss
    @State var num = 2
//    @State private var name: String = ""
    @State private var selectedColor: String = ("biru")
    
    @State var pick: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Alarm Color (\(num)/2)")
                        .font(.callout)
                        .bold()
                    
                    CustomColor(selectedColor: $selectedColor)
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
                    coreDM.saveAlarm(name: data.name, radius: data.radius, color: selectedColor)
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
            }.navigationTitle("Stasiun Gambir")
                .padding()
        }
        
    }

}

struct AddNewViewPage2_Previews: PreviewProvider {
    static var previews: some View {
        AddNewViewPage2(coreDM: CoreDataManager(), data: UserData(name: "", radius:""))
    }
}
