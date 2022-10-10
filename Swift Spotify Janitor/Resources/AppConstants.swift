//
//  DevelopmentConstants.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import Foundation
import SwiftUI

struct DevelopmentConstant {
    static let previewdevices = ["iPhone 12 Pro", "iPhone 14 Pro Max"]
}

struct UserDefaultConstants{
    static let refreshToken = "User_Refresh_Token"
}

struct AppColorConstants {
    static let backgroundColor = spotifyDarkColor
    static let backgroundGradient = LinearGradient(colors: [spotifyGreenColor.opacity(0.4), spotifyDarkColor.opacity(0.4)], startPoint: .top, endPoint: .bottom)
    static let bottomNavBarGradient = LinearGradient(colors: [spotifyDarkColor.opacity(0), spotifyDarkColor.opacity(0.5), spotifyDarkColor.opacity(0.8)], startPoint: .top, endPoint: .bottom)
    static let imageGradient = LinearGradient(colors: [spotifyGreenColor.opacity(0.2), spotifyDarkColor.opacity(0.4)], startPoint: .top, endPoint: .bottom)
    static let spotifyDarkColor = Color.init(hex: "191414")
    static let spotifyGreenColor = Color.init(hex: "1DB954")
    static let spotifyWhiteColor = Color.init(hex: "FFFFFF")
    static let appRedColor = Color.init(hex: "cc2854")
}

struct AppDimensionConstants {
    static let dimension256 = 256.0
    static let dimension128 = 128.0
    static let dimension64 = 64.0
    static let dimension32 = 32.0
    static let dimension24 = 24.0
    static let dimension16 = 16.0
}

struct AppPaddingConstants {
    static let padding8 = 8.0
    static let padding6 = 6.0
    static let padding4 = 4.0
    static let padding2 = 2.0
}

struct AppFontNameConstants {
    static let poppinsExtraBold = "Poppins-ExtraBold"
    static let poppinsRegular = "Poppins-Regular"
    static let poppinsLight = "Poppins-Light"
}

struct AppFontSizeConstants {
    static let fontSize40 = 40.0
    static let fontSize32 = 32.0
    static let fontSize24 = 24.0
    static let fontSize16 = 16.0
    static let fontSize14 = 14.0
    static let fontSize12 = 12.0
}

struct AppCornerRadiusConstants {
    static let cornerRadius40 = 40.0
    static let cornerRadius20 = 20.0
}

struct AppTransitionDelayConstants {
    static let splashScreenDelay = 2.5
    static let expandAnimationDelay = 0.6
}

struct SpotifyLogoDimensionConstants {
    static let smallWidth = 140.0
    static let smallHeight = 42.0
}


