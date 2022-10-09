//
//  LoginScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var networkManager = NetworkManager.shared
    @State private var isActive = false
    let mainScreen = MainScreen()
    
    var body: some View {
        NavigationView {
            ZStack {
                GradientTopBox()
                VStack {
                    Text("Let's start cleaning up")
                        .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize40))
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Spacer()
                    AppColorGradientImage(imageName: "taya-iv-sBr-g8wJw5k-unsplash", imageWidth: AppDimensionConstants.dimension256, imageHeight: AppDimensionConstants.dimension256)
                    Spacer()
                    Text("This Spotify Janitor is in no way affiliated with Spotify AB.")
                        .font(Font.custom(AppFontNameConstants.poppinsLight, size: AppFontSizeConstants.fontSize14))
                        .padding(.all)
                        .multilineTextAlignment(.center)
                    AuthenticationButton(type: AuthenticationButton.AuthenticationType.Login, buttonAction: openSpotifyAuthentication)
                    NavigationLink(destination: mainScreen,
                                   isActive: $isActive,
                                   label: { EmptyView() })
                }
                .onChange(of: networkManager.accessToken.accessToken) { newToken in
                    modelData.loadAlbumData()
                    modelData.loadProfileData()
                    modelData.loadTrackData()
                    navigateToMain()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
    }
    
    func openSpotifyAuthentication() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "accounts.spotify.com"
        urlComponents.path = "/en/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "db3571c8b48049b595fa9acb17be9d3a"),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "redirect_uri", value: "swiftspotifyjanitor://callback"),
            URLQueryItem(name: "scope", value: "user-library-modify user-read-private user-library-read"),
            URLQueryItem(name: "show_dialog", value: "true")
        ]
        
        UIApplication.shared.open(URL(string: urlComponents.string!)!)
    }
    
    func navigateToMain() {
        self.isActive = true
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            LoginScreen()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
