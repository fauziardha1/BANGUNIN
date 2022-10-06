//
//  NavigationBar.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 02/10/22.
//

import Foundation
import SwiftUI

struct NavigationBar: View {
    var body: some View{
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Alarm")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
        }
    }
    private func addItem() {
        print("halo")
    }
}



struct nav: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
