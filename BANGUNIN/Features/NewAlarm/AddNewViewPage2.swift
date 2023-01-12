//
//  AddNewViewPage2.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 17/11/22.
//

import SwiftUI

struct AddNewViewPage2: View {
    
    @StateObject var savedata = DataSave()
    
    let coreDM: CoreDataManager
    @State public var alarms: [DataAlarm] = [DataAlarm]()
    
    let data: UserData
    
    @Environment(\.dismiss) var dismiss
    @State var num = 2
    @State private var selectedColor: String = ("biru")
    @State var pick: String = ""
    @State var isPresentAlert = false
    @State var isGoBackHome = false
    
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
                    CustomDropDown(flag: 0, sound: savedata)
                }
                
                VStack(alignment: .leading) {
                    Text("Vibration")
                        .font(.callout)
                        .bold()
                    CustomSlider(vibrationname: savedata)
                }
                
                VStack(alignment: .leading) {
                    Text("Repeat")
                        .font(.callout)
                        .bold()
                    CustomDropDown(flag: 1, sound: savedata)
                }

                Spacer()

                Button(action: {
                    print(data.radius)
                    print(data.name)
                    print(selectedColor)
                    print(savedata.AlertSound)
                    print(savedata.RepeatSound)
                    print(savedata.Vibration)
                    self.num = 2
//                    coreDM.saveAlarm(name: data.name, radius: data.radius, color: selectedColor, alert: savedata.AlertSound, repeatsound: savedata.RepeatSound, vibration: savedata.Vibration)
                    
                    coreDM.saveAnAlarm(name: data.name, radius: data.radius, color: selectedColor, alert: savedata.AlertSound, repeatsound: savedata.RepeatSound, vibration: savedata.Vibration) { status in
                        
                        print(" showing alert")
                        isPresentAlert = true
                        
                    } onFailure: { error in
                        print("showing error")
                    }

                    
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
        .alert(
            title: "Alarm Created",
            message: "Your alarm has been created!\nSit back and we’ll wake you up\nwhen you get close",
            alertStatus: AlertStatus.success,
            dismissButton: CustomAlertButton(title: "Back to Home", action: {
                self.isGoBackHome = true
            }),
            isPresented:  $isPresentAlert
        )
        .navigate(to: customTabBar(router: TabRouter()), when: self.$isGoBackHome)
        
    }

}

struct AddNewViewPage2_Previews: PreviewProvider {
    static var previews: some View {
        AddNewViewPage2(coreDM: CoreDataManager(), data: UserData(name: "", radius:""))
    }
}
