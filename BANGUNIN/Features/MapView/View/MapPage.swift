//
//  MapPage.swift
//  BANGUNIN
//
//  Created by FauziArda on 30/09/22.
//

import SwiftUI
import MapKit

struct MapPage: View {

    
    @StateObject private var vm = MapPageViewModel()
    @StateObject private var locationManager = LocationManager()
    
    
    
    var body: some View {
        ZStack {
            // map view
            VStack {
                NavigationView {
                    Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations){
                        location in
                        
                        location.name == "current"
                        ? MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                            
                            NavigationLink{
                                Text(location.name)
                            } label :{
                                Circle()
                                    .stroke(.orange, lineWidth: 8)
                                    .frame(width: 16, height: 16)
                            }
                    
                        }
                        :
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
            
            // button current location
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let latitude = locationManager.lastLocation?.coordinate.latitude ?? 0
                        let longitude = locationManager.lastLocation?.coordinate.longitude ?? 0
                        
                        vm.updateLocation(latitude, longitude)
                    }
                    label : {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 32,height: 32 )
                            .foregroundColor(.orange)
                    }
                    
                }
                .padding(.bottom, 16)
                .padding(.trailing, 16)
                
            
            }
            
            
        }
        
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}

