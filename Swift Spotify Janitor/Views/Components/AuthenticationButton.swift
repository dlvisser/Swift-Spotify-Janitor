//
//  AuthenticationButton.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 09/10/2022.
//

import Foundation
import SwiftUI

struct AuthenticationButton : View{
    enum AuthenticationType {
        case Login
        case Logout
    }
    
    let type : AuthenticationType
    var buttonAction : () -> ()
    
    init(type: AuthenticationType, buttonAction: @escaping () -> Void) {
        self.type = type
        self.buttonAction = buttonAction
    }
    
    var body: some View{
        Button(action: {buttonAction()}){
            HStack {
                getButtonText()
                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize24))
                    .foregroundColor(AppColorConstants.spotifyWhiteColor)
                Image("Spotify_Logo_RGB_White")
                    .resizable()
                    .frame(width: SpotifyLogoDimensionConstants.smallWidth, height: SpotifyLogoDimensionConstants.smallHeight)
            }
            .padding(.all)
        }
        .background(AppColorConstants.spotifyGreenColor)
        .cornerRadius(AppCornerRadiusConstants.cornerRadius40)
    }
    
    func getButtonText() -> Text{
        switch (type){
        case .Login:
            return (Text("Log in with"))
        case .Logout:
            return (Text("Log out of"))
        }
    }
}
