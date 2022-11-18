//
//  AddNewView3.0.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 17/11/22.
//

import SwiftUI

struct AddNewView: View {
    @State var condition = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.mint)
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
                .offset(y: -geometry.size.height/18/3)
                .rotationEffect(Angle(degrees: 45))
                .onTapGesture{
                    condition = true
                }
            }
        }.navigate(to: customTabBar(router: TabRouter()), when: $condition)
    }
}

struct AddNewView3_0_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}
