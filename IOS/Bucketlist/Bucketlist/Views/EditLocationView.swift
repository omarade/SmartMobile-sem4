//
//  EditLocationView.swift
//  Bucketlist
//
//  Created by Omar on 06/11/2022.
//

import SwiftUI

struct EditLocationView: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void
    
    @State private var name: String
    @State private var description: String
    
    //wiki API
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section("Nearby..") {
                    switch loadingState {
                    case .loading:
                        Text("Loading..")
                    case .success:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Failed")
                    }
//                    if(loadingState == .loading) {
//                        Text("Loading..")
//                    } else if (loadingState == .loaded) {
//
//                    }
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button ("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    
    //@escaping is for calling this function later when save button is clicked
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    //WIKI GPS API
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            pages = items.query.pages.values.sorted()
            loadingState = .success
        } catch {
            loadingState = .failed
        }
    }
}

struct EditLocationView_Previews: PreviewProvider {
    static var previews: some View {
        EditLocationView(location: Location.example) { _ in }
    }
}
