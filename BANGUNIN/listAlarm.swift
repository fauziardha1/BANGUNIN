//
//  lisAalarm.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 29/09/22.
//

import Foundation
import SwiftUI

struct ListAlarm: View {
    
    @State private var show_add: Bool = false
    
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: DetailAlarm()) {
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
                }.foregroundColor(.black)
                NavigationLink(destination: DetailAlarm()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.white)
                            .border(Color.orange)
                            .frame(height: 100)
                        VStack{
                            HStack{
                                Text("How to manage backlog using Jira")
                                    .font(.title3)
                                    .padding(.all, 15)
                                Spacer()
                            }
                            HStack(alignment: .bottom){
                                Text("Product")
                                    .padding(.leading, 10)
                                Spacer()
                                Text(Date.now, format: .dateTime.day().month().year())
                                    .padding(.trailing
                                             , 10)
                            }
                        }
                    }
                    .padding(.trailing, 15)
                .padding(.leading, 15)
                }.foregroundColor(.black)
                NavigationLink(destination: DetailAlarm()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.white)
                            .border(Color.red)
                            .frame(height: 100)
                    }.padding(.trailing, 15)
                        .padding(.leading, 15)
                }.foregroundColor(.black)
                Spacer()
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        print("onklik")
                        self.show_add = true
                    }){
                        Label("add item", systemImage: "plus")
                            .foregroundColor(Color.orange)
                    }.sheet(isPresented: self.$show_add) {
                        
                    }
                }
            }
            .navigationTitle("Alarm")
            .foregroundColor(Color.orange)
        }
    }
}

//struct ToggleButton: View {
//    @State private var showGreeting = true
//
//    var body: some View {
//        VStack {
//            Toggle("", isOn: $showGreeting)
//                .toggleStyle(SwitchToggleStyle(tint: .red))
//
//            if showGreeting {
//                Text("Active")
//            }
//        }
//    }
//}

struct list: PreviewProvider{
    static var previews: some View{
        ListAlarm()
    }
}

