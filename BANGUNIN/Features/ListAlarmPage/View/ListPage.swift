//
//  ListPage.swift
//  BANGUNIN
//
//  Created by Zevira varies martan on 03/10/22.
//

import SwiftUI

struct ListPage: View {
    
    @EnvironmentObject var router: TabRouter
    
    var body: some View {
        ZStack {
            Text("List Page")
                .bold()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mint)
        .clipped()
    }
}

struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage()
            .environmentObject(TabRouter())
    }
}
