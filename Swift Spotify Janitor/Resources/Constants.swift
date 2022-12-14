//
//  DevelopmentConstants.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import Foundation
import SwiftUI

struct DevelopmentConstant{
    
    static let previewdevices = ["iPhone 12 Pro", "iPhone 14 Pro Max"]
}

struct AppColorConstants{
    static let backgroundColor = spotifyDarkColor
    static let backgroundGradient = LinearGradient(colors: [spotifyGreenColor.opacity(0.4),spotifyDarkColor.opacity(0.4)], startPoint: .top, endPoint: .bottom)
    static let bottomNavBarGradient = LinearGradient(colors: [spotifyDarkColor.opacity(0),spotifyDarkColor.opacity(0.5),spotifyDarkColor.opacity(0.8)], startPoint: .top, endPoint: .bottom)
    static let imageGradient = LinearGradient(colors: [spotifyGreenColor.opacity(0.2),spotifyDarkColor.opacity(0.4)], startPoint: .top, endPoint: .bottom)
    static let spotifyDarkColor = Color.init(hex: "191414")
    static let spotifyGreenColor = Color.init(hex: "1DB954")
    static let spotifyWhiteColor = Color.init(hex: "FFFFFF")
    static let appRedColor = Color.init(hex: "cc2854")
}


