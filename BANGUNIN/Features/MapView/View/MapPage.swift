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
            
            // search bar
            VStack {
                SearchBar(locationManager: self.locationManager, color: .white)
                
                if let places =  self.locationManager.fetchedPlaces, !places.isEmpty{
                    List {
                        ForEach(places, id: \.self){
                            place in
                            HStack(spacing: 15){
                                Image(systemName: "mappin.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(place.name ?? "")
                                        .font(.title3.bold())
                                    
                                    Text(place.locality ?? "")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            
                        }
                    }
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .listStyle(.plain)
                    
                }
                Spacer()
            }
            
            // button current location
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let latitude = locationManager.lastLocation?.coordinate.latitude ?? -6.211275294338611 // jakarta
                        let longitude = locationManager.lastLocation?.coordinate.longitude ?? 106.8391278109003 // jakarta
                        
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

