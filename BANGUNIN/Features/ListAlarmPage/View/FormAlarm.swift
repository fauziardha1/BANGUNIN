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

struct FormAlarm: View {
    @State var alarmname: String = ""
    @State var radiusColor: Radius = .Orange
    @State var alert: AlertSound = .Radar
    @State var vibrate: Vibration = .None
    @State var range = 0
    
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Range:")
            Picker("Range", selection: $range) {
                Text("100").tag(0)
                Text("200").tag(1)
                Text("300").tag(2)
                Text("Custom").tag(3)
            }
            .pickerStyle(.segmented)
            VStack(alignment: .leading) {
                Text("Alarm name")
                    .font(.callout)
                    .bold()
                TextField("Name the alarm", text: $alarmname)
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
            Spacer()
        }.padding()
    }
}


struct formAlarm: PreviewProvider {
    static var previews: some View {
        FormAlarm()
    }
}
