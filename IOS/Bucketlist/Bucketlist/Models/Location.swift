//
//  Location.swift
//  Bucketlist
//
//  Created by Omar on 06/11/2022.
//

import Foundation
import MapKit

struct Location: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    //computed property
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = Location(name: "Rijks Museum", description: "", latitude: 52.359997, longitude: 4.885219)
    
    
    static func  ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
