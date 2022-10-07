//
//  MainScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var modelData : ModelData
    @StateObject var networkManager = NetworkManager.shared

    var body: some View {
        TabView{
            AlbumScreen()
                .tabItem{
                    Label("Albums", image: "albums")
                }
            TrackScreen()
                .tabItem{
                    Label("Tracks", image: "tracks")
                }
            ProfileScreen()
                .tabItem{
                    Label("Profile", image: "profile")
                }
        }
        .onChange(of: networkManager.accessToken.accessToken){ newToken in
            print("onchange")
            modelData.loadAlbumData()
            modelData.loadProfileData()
        }
        .accentColor(AppColorConstants.spotifyWhiteColor)
        .preferredColorScheme(.dark)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            MainScreen()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
