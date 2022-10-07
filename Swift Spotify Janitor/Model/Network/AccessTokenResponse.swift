//
//  AccessTokenResponse.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 19/09/2022.
//

import Foundation

struct AccessTokenResponse: Decodable, Hashable{
    var accessToken : String
    var tokenType : String
    var expiresAt : Int
    var scope : String
    var refreshToken : String?
    
    private enum CodingKeys : String, CodingKey{
        case accessToken = "access_token", tokenType = "token_type", expiresAt = "expires_in", scope, refreshToken = "refresh_token"
    }
    
    static let sample = AccessTokenResponse(accessToken: "", tokenType: "", expiresAt: 0, scope: "")
}
