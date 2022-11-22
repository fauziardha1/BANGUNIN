//
//  AddNewView3.0.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/11/22.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.dismiss) var dismiss
    @State var num = 1
    @State private var alarmName: String = ""
    
    let radius: [String] = ["300", "500", "700", "900"]
    
    @State var pick: String = ""
    
    @State var condition = false
    
    var body: some View {
        GeometryReader { geometry in
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
                    
                    NavigationLink(destination: AddNewViewPage2().navigationBarBackButtonHidden(true)) {
                        
                        Text("Next")
                            .fontWeight(.bold)
                            .foregroundColor(Color("bg"))
                            .padding(.vertical, 17)
                            .padding(.horizontal, 150)
                            .background(Color("primary"))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }
                    
                    
                    //                Text(String(num))
                }.navigationBarTitleDisplayMode(.inline)
                    .padding()
                    .toolbar{
                        ToolbarItem(placement: .principal){
                            HStack(spacing: 20) {
                                Button(action: {}){
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Color("close-in"))
                                            .frame(width: geometry.size.width/8, height: geometry.size.width/8)
                                            .shadow(radius: 4)
                                        
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: geometry.size.width/8 , height: geometry.size.width/8)
                                            .foregroundColor(Color("close-out"))
                                    }
                                    .offset(y: -geometry.size.height/340/2)
                                    .rotationEffect(Angle(degrees: 45))
                                    .onTapGesture{
                                        dismiss()
                                    }
                                }
                                Text("Stasiun Gambir")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }

                        }
                    }
            }
        }
        .navigate(to: customTabBar(router: TabRouter()), when: $condition)
        
    }
}


struct AddNewView3_0_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}
