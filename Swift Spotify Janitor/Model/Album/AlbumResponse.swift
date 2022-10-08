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
    
    static let sample = AlbumResponse(aItems:
        [AlbumItem(addedDate: "", album:
                    Album(albumType: "Album", artists:
                            [Artist(id: "", name: "Test Artist", type: "", uri: "")], id: "", name: "Test Album", popularity: 0, uri: "", label: "", releaseDate: "", images: [ImageData(height: 0, width: 0, url: "https://developer.spotify.com/assets/branding-guidelines/icon3@2x.png"), ImageData(height: 20, width: 20, url: "https://developer.spotify.com/assets/branding-guidelines/icon3@2x.png")]))])
}
