//
//  Profile.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 30/08/2022.
//

import Foundation

struct ProfileData: Codable {
    var displayName: String
    var email: String?
    var images: [ImageData]
    var product: String
    var uri: String

    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name", email, images, product, uri
    }

    static let sample = ProfileData(displayName: "Spotify User", email: "spotify@spotifytest.nl", images: [ImageData(height: 50, width: 50, url: "https://developer.spotify.com/assets/branding-guidelines/icon3@2x.png")], product: "Spotify free", uri: "")
}
