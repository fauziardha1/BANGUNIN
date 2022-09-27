//
//  ContentView.swift
//  BANGUNIN
//
//  Created by FauziArda on 26/09/22.
//

import SwiftUI
import MapKit

struct Location : Identifiable{
    var id : UUID = UUID()
    var name : String
    var latitude : Double
    var longitude : Double
    
    static var location = Location(name: "default", latitude: 51.5, longitude: -0.12)
}

var locations = [
    Location(name: "Jakarta", latitude: -6.212922, longitude: 106.848723),
    Location(name: "Monas", latitude: -6.175394, longitude: 106.827186),
    Location(name: "GOP", latitude: -6.302230, longitude: 106.652264)
]


struct ContentView: View {
   
    
    @State private var  mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(
        latitude: locations.last!.latitude,
        longitude: locations.last!.longitude
        ),
         span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05
         )
    )
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            NavigationView {
                Map(coordinateRegion: $mapRegion, annotationItems: locations){
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
                .navigationTitle("Jakarta Explorer")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
