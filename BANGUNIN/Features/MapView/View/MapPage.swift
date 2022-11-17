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
            SearchBar()
            
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
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        let current = Date().timeIntervalSince1970 * 1000

                        let interval = 10 * 1000

                        var update = current
                        while true {
                            print("hello \(current) : \(update)")

                            if update >= current + Double(interval) {
                                
                                for _  in 0...10{
                                    SoundManager.instance.play()
                                    sleep(1)
                                }

                                print("bunyiii")
                                break
                            }
                            
                            
                            if update >= current + Double(interval){
                                break
                            }
                            

                            sleep(1)
                            update = Date().timeIntervalSince1970 * 1000
                            
                            
                            
                            
                        }
                        
//                        SoundManager.instance.play()
                        
                        
                    }
                    label : {
                        Image(systemName: "alarm.fill")
                            .resizable()
                            .frame(width: 32,height: 32 )
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(100)
                    
                }
                .padding(.bottom, 100)
                .padding(.trailing, 100)
                
                
            
            }
            
            
        }
        
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}

