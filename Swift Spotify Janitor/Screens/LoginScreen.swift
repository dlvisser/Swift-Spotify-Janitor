//
//  LoginScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var modelData : ModelData
    @StateObject var networkManager = NetworkManager.shared
    @State private var isActive = false
    let mainScreen = MainScreen()
    
    
    
    var body: some View {
        NavigationView {
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
                VStack {
                    Text("Let's start cleaning up")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Spacer()
                    Text("This Spotify Janitor is in no way affiliated with Spotify AB.")
                        .font(.body.weight(Font.Weight.thin))
                        .padding(.all)
                        .multilineTextAlignment(.center)
                    Button(action: openSpotifyAuthentication){
                        HStack{
                            Text("Log in with")
                                .font(.body.bold())
                                .foregroundColor(AppColorConstants.spotifyWhiteColor)
                            Image("Spotify_Logo_RGB_White")
                                .resizable()
                                .frame(width: 140, height: 42)
                        }.padding(.all)
                    }
                    .background(AppColorConstants.spotifyGreenColor)
                    .cornerRadius(40)
                    NavigationLink(destination: mainScreen,
                                   isActive: $isActive,
                                   label: { EmptyView() })
                    }
                .onChange(of: networkManager.accessToken){ newToken in
                    navigateToMain()}
                }
            }
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
    }
    
    func openSpotifyAuthentication(){
        UIApplication.shared.open(URL(string: "https://accounts.spotify.com/en/authorize?client_id=db3571c8b48049b595fa9acb17be9d3a&response_type=code&redirect_uri=swiftspotifyjanitor://callback&scope=user-read-email%20user-read-private%20user-library-read&show_dialog=true")!)
    }
    
    func navigateToMain(){
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
