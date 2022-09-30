//
//  MainView.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI

struct MainView: View {
    var status = true
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
