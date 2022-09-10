//
//  Profile.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 30/08/2022.
//

import Foundation

struct ProfileData : Codable{
    var displayName : String
    var email: String
    var images: [ImageData]
    var product : String
    var uri : String
    
    private enum CodingKeys: String, CodingKey{
        case displayName = "display_name", email, images, product, uri
    }
}
