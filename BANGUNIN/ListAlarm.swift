//
//  ListAlarm.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 06/10/22.
//

import Foundation
import SwiftUI

struct AlarmList: View {
    var body: some View{
        NavigationView {
            ScrollView {
                VStack{
//                    NavigationLink(destination: DetailAlarm()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.white)
                                .border(Color.blue)
                                .frame(height: 100)
                            VStack{
                                HStack{
                                    Text("Using UIkit programtically")
                                        .font(.title3)
                                        .padding(.all, 15)
                                    Spacer()
                                    ToggleButton()
                                }.padding()
                            }
                        }
                        .padding(.trailing, 15)
                        .padding(.leading, 15)
//                    }.foregroundColor(.black)
//                    NavigationLink(destination: DetailAlarm()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.white)
                                .border(Color.blue)
                                .frame(height: 100)
                            VStack{
                                HStack{
                                    Text("Stasiun Rawa Buntu")
                                        .font(.title3)
                                        .padding(.all, 15)
                                    Spacer()
                                    ToggleButton()
                                }.padding()
                            }
                        }
                        .padding(.trailing, 15)
                        .padding(.leading, 15)
//                    }.foregroundColor(.black)
//                    NavigationLink(destination: DetailAlarm()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10.0)
                                .fill(Color.white)
                                .border(Color.blue)
                                .frame(height: 100)
                            VStack{
                                HStack{
                                    Text("Stasiun Kebayoran")
                                        .font(.title3)
    //                                    .padding(.all, 15)
    //                                Spacer()
                                    ToggleButton()
                                }.padding()
                            }
                        }
                        .padding(.trailing, 15)
                        .padding(.leading, 15)
//                    }.foregroundColor(.black)
                    Spacer()
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
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        }
    }
    private func addItem() {
        print("halo")
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
