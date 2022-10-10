//
//  ListAlarm.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 06/10/22.
//

import Foundation
import SwiftUI

struct AlarmList: View {
    
    var places = ["Stasiun Rawamangun","Stasiun Rawabuntu","Stasiun Kebayoran"]
    
    
    var body: some View{
        NavigationView {
            ScrollView {
                VStack{
                    ForEach(places, id: \.self) { place in
                        ListView(labelAlarm: place)
                        Spacer()
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                                .foregroundColor(Color.orange)
                        }
                    }
                }
                .navigationTitle("Alarm")
            }
        }
    }
    private func addItem() {
        print("halo")
    }
}

struct ListView: View{
    
    var labelAlarm: String
    
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.white)
                .border(Color.blue)
                .frame(height: 100)
            VStack{
                HStack{
                    Text(labelAlarm)
                        .font(.title3)
                        .padding(.all, 15)
                    Spacer()
                    ToggleButton()
                }.padding()
            }
        }
        .padding(.trailing, 15)
        .padding(.leading, 15)
    }
}

struct ToggleButton: View {
    @State private var showGreeting = false
    
    var body: some View {
        VStack {
            Toggle("", isOn: $showGreeting)
                .toggleStyle(SwitchToggleStyle(tint: .orange))
            
            if showGreeting {
                Text("Active")
            }
        }
    }
}


struct nav: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}
