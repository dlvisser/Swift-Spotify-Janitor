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
        ZStack{
            ZStack(alignment: .top){
                AppColorConstants.backgroundColor
                GeometryReader{ geo in
                    Rectangle()
                        .fill(AppColorConstants.backgroundGradient)
                        .frame(width: geo.size.width, height: geo.size.height/3)
                }
            }
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text("This should be you... Right?")
                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize32))
                    .multilineTextAlignment(.leading)
                ProfileTag()
                Spacer()
            }
            .padding(.horizontal)
            VStack(alignment: .center) {
                Spacer()
                Button(action: openSpotifyLogOutSession){
                    HStack{
                        Text("Log out of")
                            .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize24))
                            .foregroundColor(AppColorConstants.spotifyWhiteColor)
                        Image("Spotify_Logo_RGB_White")
                            .resizable()
                            .frame(width: SpotifyLogoDimensionConstants.smallWidth, height: SpotifyLogoDimensionConstants.smallHeight)
                    }.padding(.all)
                }
                .background(AppColorConstants.spotifyGreenColor)
                .cornerRadius(AppCornerRadiusConstants.cornerRadius40)
                NavigationLink(
                    destination: loginScreen,
                    isActive: $isReturned,
                    label: {EmptyView()})
            }
            .padding(.bottom)
        }
        .preferredColorScheme(.dark)
    }
    
    func openSpotifyLogOutSession(){
        NetworkManager.shared.accessToken = AccessTokenResponse.sample
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "User_Refresh_Token")
        UIApplication.shared.open(URL(string: "https://accounts.spotify.com/logout")!)
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
