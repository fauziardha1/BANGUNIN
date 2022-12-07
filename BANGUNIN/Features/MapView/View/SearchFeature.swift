//
//  SearchFeature.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 06/10/22.
//



import Foundation
import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    var color: Color

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 20, height: 19)
                        .padding(.horizontal)
                    TextField("Search here", text: $searchText)
                }
                .frame(height: 57)
                .background(color)
                .cornerRadius(32)
                .padding(.horizontal)
            
//            Spacer()
        }
            
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(color: .white)
    }
}
