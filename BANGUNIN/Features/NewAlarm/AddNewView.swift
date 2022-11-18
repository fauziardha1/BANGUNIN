//
//  AddNewView3.0.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/11/22.
//

import SwiftUI

struct AddNewView: View {
    @State var num = 1
    @State private var alarmName: String = ""
    
    let radius: [String] = ["300", "500", "700", "900"]
    
    @State var pick: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                
                VStack(alignment: .leading) {
                    Text("Pinpoint (\(num)/2)")
                        .font(.callout)
                        .bold()
                    
                    Image("stasiun_gambir")
                        .resizable()
                        .frame(width: 350, height: 200)
                }
                
                VStack(alignment: .leading) {
                    Text("Radius (in meter)")
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
                            .opacity(rad == pick ? 2.0 : 0.5)
                            .scaleEffect(rad == pick ? 1.1 : 1.0)
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
                    Text("Alarm name")
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
                    
                    Text("Next")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bg"))
                        .padding(.vertical, 17)
                        .padding(.horizontal, 150)
                        .background(Color("primary"))
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                
//                Text(String(num))
            }.navigationTitle("Stasiun Gambir")
                .padding()
//                .background(Color("bg"))
        }
        
    }
}

struct AddNewView3_0_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}
