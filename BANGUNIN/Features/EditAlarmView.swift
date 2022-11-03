//
//  EditAlarmView.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/10/22.
//

import Foundation
import SwiftUI


enum Radius: String, CaseIterable,Identifiable {
    case Orange, Blue, Yellow
    var id: Self {self}
}

enum AlertSound: String, CaseIterable,Identifiable {
    case Radar, Rudur , Rodor
    var id: Self {self}
}

enum Vibration: String, CaseIterable,Identifiable {
    case None, Normal, Custom
    var id: Self {self}
}

enum Repeat: String, CaseIterable,Identifiable {
    case Never, Everyday, EveryMonday
    var id: Self {self}
}

struct EditView: View {
    let coreDM: CoreDataManager
    @State private var alarmName: String = ""
    @State private var radiusAlarm = 0
        // NOT A GOOD IDEA TO USE STATE TO POPULATE DATA FROM
        // THIRD PARTY CALL
        @State public var alarms: [Alarm] = [Alarm]()
        //        @State private var needsRefresh: Bool = false
    
//    @State var alarmname: String = ""
    @State var radiusColor: Radius = .Orange
    @State var alert: AlertSound = .Radar
    @State var vibrate: Vibration = .None
//    @State var range = 0
    
    private func collectAlarm() {
            alarms = coreDM.getAllAlarms()
        }
    
    
    var body: some View{
        
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Range:")
            Picker("Range", selection: $radiusAlarm) {
                Text("100").tag(0)
                Text("200").tag(1)
                Text("300").tag(2)
                Text("Custom").tag(3)
            }
            }
            .pickerStyle(.segmented)
            VStack(alignment: .leading) {
                Text("Alarm name")
                    .font(.callout)
                    .bold()
                TextField("Name the alarm", text: $alarmName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading) {
                Text("Radius color")
                    .font(.callout)
                    .bold()
                List {
                    Picker("Choose Color", selection: $radiusColor) {
                        Text("Orange").tag(Radius.Orange)
                        Text("Blue").tag(Radius.Blue)
                        Text("Yellow").tag(Radius.Yellow)
                    }.pickerStyle(MenuPickerStyle())
                }.frame(maxHeight: 100)
            }
            VStack(alignment: .leading) {
                Text("Alert")
                    .font(.callout)
                    .bold()
                List{
                    Picker("Choose Alert", selection: $alert) {
                        Text("Radar").tag(AlertSound.Radar)
                        Text("Rodor").tag(AlertSound.Rodor)
                        Text("Rudur").tag(AlertSound.Rudur)
                    }.pickerStyle(MenuPickerStyle())
                }.frame(maxHeight: 100)
                
            }
            VStack(alignment: .leading) {
                Text("Vibration")
                    .font(.callout)
                    .bold()
                List {
                    Picker("Choose Vibration", selection: $vibrate) {
                        Text("None").tag(Vibration.None)
                        Text("Custom").tag(Vibration.Custom)
                        Text("Normal").tag(Vibration.Normal)
                    }.pickerStyle(MenuPickerStyle())
                }.frame(maxHeight: 100)
            }
            Button("Save") {
                coreDM.saveAlarm(name: alarmName, radius: Double(radiusAlarm))
                collectAlarm()
                print("oke di sep")
            }
            .frame(width: 100, height: 50)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            List {
                ForEach(alarms, id: \.self){ alarm in
                    VStack {
                        Text("\(alarm.radius)")
                        Text(alarm.name ?? "")
                    }
                    
                }.onDelete(perform: {indexSet in
                    indexSet.forEach { index in
                        let alarm = alarms[index]
                        coreDM.deleteAlarm(alarm: alarm)
                        collectAlarm()
                    }
                })
            }

            Spacer()
        }.padding()
    }
}



struct editview: PreviewProvider {
    static var previews: some View {
        EditView(coreDM: CoreDataManager())
    }
}
