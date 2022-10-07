//
//  SearchFeature.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 06/10/22.
//



import Foundation
import SwiftUI

struct SearchBar: View {
    let names = ["zev", "puji", "radya", "arip"]
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: AlarmList()) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Contacts")
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
