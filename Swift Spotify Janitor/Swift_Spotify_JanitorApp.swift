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
                .onOpenURL(perform: { url in
                    openURL(url: url)
                })
        }
    }
    
    
    // https://benoitpasquier.com/deep-linking-url-scheme-ios/
    // https://developer.apple.com/documentation/xcode/defining-a-custom-url-scheme-for-your-app
    func openURL(url: URL) -> String {

         // Process the URL.
         guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: true),
             let tokenPath = components.path,
             let params = components.queryItems else {
                 print("Invalid URL or album path missing")
                 return "Empty"
         }

         if let authToken = params.first(where: { $0.name == "code" })?.value {
             print("tokenPath = \(tokenPath)")
             print("authToken = \(authToken)")
             return authToken
         } else {
             print("AuthToken missing")
             return "Empty"
         }
     }
}
