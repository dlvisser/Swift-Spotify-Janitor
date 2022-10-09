//
//  ProfileScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 05/10/2022.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State var isReturned = false
    let loginScreen = LoginScreen()
    
    var body: some View {
        ZStack {
            GradientTopBox()
            VStack(alignment: .leading) {
                Text("This should be you... Right?")
                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize32))
                    .multilineTextAlignment(.leading)
                ProfileTag()
                Spacer()
            }
            .padding(.horizontal)
            VStack(alignment: .center) {
                Spacer()
                AuthenticationButton(type: AuthenticationButton.AuthenticationType.Logout, buttonAction: openSpotifyLogOutSession)
                NavigationLink(
                    destination: loginScreen,
                    isActive: $isReturned,
                    label: { EmptyView() })
            }
            .padding(.bottom)
        }
        .preferredColorScheme(.dark)
    }
    
    func openSpotifyLogOutSession() {
        NetworkManager.shared.accessToken = AccessTokenResponse.sample
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserDefaultConstants.refreshToken)
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "accounts.spotify.com"
        urlComponent.path = "/logout"
        
        UIApplication.shared.open(URL(string: urlComponent.string!)!)
        isReturned = true
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            ProfileScreen()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
