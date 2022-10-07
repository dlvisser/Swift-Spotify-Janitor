//
//  Album.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 28/08/2022.
//

import Foundation

struct Album: Codable, Identifiable{
    var albumType: String
    var artists: [Artist]
    var id : String
    var name: String
    var popularity: Int?
    var uri : String
    var label: String?
    var releaseDate : String
    var images: [ImageData]
    
    private enum CodingKeys: String, CodingKey{
        case albumType = "album_type", artists, id, name, popularity, uri, label, releaseDate = "release_date", images
    }
}
