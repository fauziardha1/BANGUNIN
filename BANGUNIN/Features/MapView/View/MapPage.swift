//
//  MapPage.swift
//  BANGUNIN
//
//  Created by FauziArda on 30/09/22.
//

import SwiftUI
import MapKit

struct MapPage: View {
    
    @StateObject var vm = MapPageViewModel()
    
    var body: some View {
        VStack {
            NavigationView {
                Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations){
                    location in
                    
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        
                        NavigationLink{
                            Text(location.name)
                        } label :{
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44)
                        }
                
                    }
                }
                .ignoresSafeArea(.container, edges: .top)
            }
        }
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}

