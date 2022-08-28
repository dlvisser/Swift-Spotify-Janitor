//
//  Swift_Spotify_JanitorApp.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

@main
struct Swift_Spotify_JanitorApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
