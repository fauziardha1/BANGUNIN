//
//  LocationManager.swift
//  BANGUNIN
//
//  Created by FauziArda on 07/10/22.
//

import Foundation
import CoreLocation
import MapKit

// MARK: Combine to watch textfield
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var fetchedPlaces = [CLPlacemark]()
    @Published var searchText : String = ""
    
    var cancelable : AnyCancellable?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        cancelable =  $searchText
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                self.fetchPlacesFromKeyword(key: value)
                if value.isEmpty {
                    self.fetchedPlaces = [CLPlacemark]()
                }
            })
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
            case .notDetermined: return "notDetermined"
            case .authorizedWhenInUse: return "authorizedWhenInUse"
            case .authorizedAlways: return "authorizedAlways"
            case .restricted: return "restricted"
            case .denied: return "denied"
            default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
    
    
    // fetch places
    func fetchPlacesFromKeyword(key : String)  {
        Task{
            do {
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = key.lowercased()
                
                let response = try await MKLocalSearch(request: request).start()
                
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> CLPlacemark? in
                        return item.placemark
                    })
                })
            }
        }
    }
}
