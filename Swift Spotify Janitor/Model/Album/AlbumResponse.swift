//
//  AlbumResponse.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 28/08/2022.
//

import Foundation

struct AlbumResponse: Codable{
    var aItems : [AlbumItem]
    
    private enum CodingKeys: String, CodingKey{
        case aItems = "items"
    }
}
