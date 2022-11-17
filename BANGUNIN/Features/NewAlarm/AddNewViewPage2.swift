//
//  AddNewViewPage2.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 17/11/22.
//

import SwiftUI

struct AddNewViewPage2: View {
    
    @State var num = 2
    @State private var alarmName: String = ""
    
    let radius: [String] = ["Blue", "Green", "Orange", "Red", "Purple", "Pink"]
    
    @State var pick: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Alarm Color (\(num)/2)")
                        .font(.callout)
                        .bold()
                    
                    HStack {
                        ForEach(radius, id: \.self) { rad in
                            VStack(spacing: 10) {
                                Text(rad)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("primary"))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color(("bg")))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color("primary")))
    
                            .onTapGesture {
                                withAnimation {
                                    pick = rad
                                }
                            }
                        }
                    }
//                    Text("radius: \(pick)")
                }
                
                VStack(alignment: .leading) {
                    Text("Alert Sound")
                        .font(.callout)
                        .bold()
                    TextField("Name the alarm", text: $alarmName)
                        .padding(20)
                        .frame(maxHeight: 50)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray))
                }
            
                VStack(alignment: .leading) {
                    Text("Repeat")
                        .font(.callout)
                        .bold()
                    TextField("Name the alarm", text: $alarmName)
                        .padding(20)
                        .frame(maxHeight: 50)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray))
                }

                Spacer()
                
                NavigationLink(destination: AddNewViewPage2()) {
                    Button(action: {
                        self.num = 2
                        
                    } , label: {
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(Color("bg"))
                            .padding(.vertical, 17)
                            .padding(.horizontal, 150)
                            .background(Color("primary"))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                    }).padding(.top)
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
