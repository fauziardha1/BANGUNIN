//
//  EditAlarmView.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/10/22.
//

import Foundation
import SwiftUI

struct EditView: View {
    @State var alarmname: String = ""
    @State var radiusColor: String = ""
    @State var alert: String = ""
    @State var vibrate: String = ""
    @State var range = 0
    var body: some View{
        VStack(alignment: .leading, spacing: 20) {
            Text("Range:")
            Picker("Range", selection: $range) {
                Text("100").tag(0)
                Text("200").tag(1)
                Text("300").tag(2)
                Text("custom").tag(3)
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
                TextField("Choose color", text: $radiusColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading) {
                Text("Alert")
                    .font(.callout)
                    .bold()
                TextField("Choose alert", text: $alert)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            VStack(alignment: .leading) {
                Text("Vibration")
                    .font(.callout)
                    .bold()
                TextField("Choose vibration", text: $vibrate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
        }.padding()
    }
}


struct editview: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
