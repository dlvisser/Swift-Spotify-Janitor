//
//  Track.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 07/10/2022.
//

import Foundation

struct Track: Codable {
    var uri: String
    var album: Album
    var popularity: Int
    var id: String
    var name: String

}
