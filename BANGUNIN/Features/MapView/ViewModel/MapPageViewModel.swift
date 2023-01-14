//
//  MapPageViewModel.swift
//  BANGUNIN
//
//  Created by FauziArda on 30/09/22.
//

import Foundation
import MapKit

extension MapPage {
    @MainActor class MapPageViewModel : ObservableObject {
        @Published var  locations = [
            Location(name: "Jakarta", latitude: -6.212922, longitude: 106.848723),
            Location(name: "Monas", latitude: -6.175394, longitude: 106.827186),
            Location(name: "GOP", latitude: -6.302230, longitude: 106.652264)
        ]
        
        @Published var  mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
            latitude: -6.302230,
            longitude: 106.652264
            ),
             span: MKCoordinateSpan(
                latitudeDelta: 0.05,
                longitudeDelta: 0.05
             )
        )
        
        // Function update location
        // it recieve input latitude and longitude,
        // if success, it will update the mapregion center location, otherwise it will error and do nothing
        func updateLocation(_ lat : Double, _ long : Double){
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
                latitude: lat,
                longitude: long
                ),
                 span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05
                 )
              )
            
            locations.append(Location(name: "current", latitude: lat, longitude: long))
        }
        
        // update mapregion
        func setMapRegion(_ newValue : MKCoordinateRegion)  {
            self.mapRegion = newValue
        }
    }
}
