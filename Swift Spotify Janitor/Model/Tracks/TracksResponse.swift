//
//  TracksResponse.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 07/10/2022.
//

import Foundation

struct TrackResponse: Codable{
    var tItems : [TrackItem]
    var limit : Int
    var offset : Int
    var total : Int
    
    private enum CodingKeys: String, CodingKey{
        case tItems = "items", limit, offset, total
    }
    
    static let sample = TrackResponse(tItems:
                                        [TrackItem(addedDate: "", track: Track(uri: "", album:
                                                                                Album(albumType: "", artists:
                                                                                        [Artist(id: "", name: "", type: "", uri: "")], id: "", name: "", popularity: 0, uri: "", label: "", releaseDate: "", images: [ImageData(height: 0, width: 0, url: ""), ImageData(height: 20, width: 20, url: "")]), popularity: 0, id: "", name: ""))], limit: 0, offset: 0, total: 0)
}
