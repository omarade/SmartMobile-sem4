//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by Omar on 04/10/2022.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)

            }
        }
    }
}
