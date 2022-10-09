//
//  TrackItem.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 07/10/2022.
//

import Foundation

struct TrackItem: Codable {
    var addedDate: String
    var track: Track

    private enum CodingKeys: String, CodingKey {
        case addedDate = "added_at", track
    }
}
