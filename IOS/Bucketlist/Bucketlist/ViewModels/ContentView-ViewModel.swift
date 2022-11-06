//
//  ContentView-ViewModel.swift
//  Bucketlist
//
//  Created by Omar on 06/11/2022.
//

import SwiftUI
import MapKit

class ViewModel: ObservableObject {
    
}


extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        //Start the map showing Westren Europe
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        //List of users saved locations
        @Published var locations = [Location]()
        
        //for tracking sheet
        @Published var selectedPlace: Location?
    }
}

struct ContentView_ViewModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_ViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_ViewModel()
    }
}
