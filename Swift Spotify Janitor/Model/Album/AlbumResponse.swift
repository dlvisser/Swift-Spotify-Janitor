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
                    Album(albumType: "", artists:
                            [Artist(id: "", name: "", type: "", uri: "")], id: "", name: "", popularity: 0, uri: "", label: "", releaseDate: "", images: [ImageData(height: 0, width: 0, url: ""), ImageData(height: 20, width: 20, url: "")]))])
}
