//
//  Home.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 03/10/22.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        ZStack {
            Text("Home Page")
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .clipped()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(TabRouter())
    }
}
