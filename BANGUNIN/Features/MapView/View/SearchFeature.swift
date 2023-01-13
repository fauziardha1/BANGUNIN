//
//  SearchFeature.swift
//  BANGUNIN
//
//  Created by Arief Ramadhan on 06/10/22.
//



import Foundation
import SwiftUI

struct SearchBar: View {
    @StateObject var locationManager : LocationManager
    var color: Color

    var body: some View {
       
        VStack {
            HStack(alignment: .top) {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 20, height: 19)
                        .padding(.horizontal)
                    TextField("Search here", text: self.$locationManager.searchText)
                
                    if !self.locationManager.searchText.isEmpty {
                        Button("Cancel") {
                             self.locationManager.searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        }.padding(.trailing)
                    }
                    
                   
                }
                .frame(height: 57)
                .background(color)
                .cornerRadius(32)
                .padding(.horizontal)
        }
            
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(locationManager: LocationManager(), color: .white)
    }
}
