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
                            .fill(Color("biru"))
                            .frame(height: 100)
                        VStack{
                            HStack{
                                Text("Using UIkit programtically")
                                    .font(.title3)
                                    .padding(.all, 15)
                                Spacer()
                            }
                            HStack(alignment: .bottom){
                                Text("Tech")
                                    .padding(.leading, 10)
                                Spacer()
//                                Text("22 July 2022")
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
                            .fill(Color("merah"))
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
                            .fill(Color("hijau"))
                            .frame(height: 100)
                        VStack{
                            VStack{
                                HStack{
                                    Text("Implemented Gastalt to create UI")
                                        .font(.title3)
                                        .padding(.all, 15)
                                    Spacer()
                                }
                                HStack(alignment: .bottom){
                                    Text("Design")
                                        .padding(.leading, 10)
                                    Spacer()
                                    Text(Date.now, format: .dateTime.day().month().year())
                                        .padding(.trailing
                                                 , 10)
                                }
                            }
                        }
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

struct list: PreviewProvider{
    static var previews: some View{
        ListAlarm()
    }
}

