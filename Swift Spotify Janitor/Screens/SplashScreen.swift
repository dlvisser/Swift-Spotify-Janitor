//
//  SplashScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 05/10/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    private let defaults = UserDefaults.standard
    private var hasToken = false
    let login = LoginScreen()
    let main = MainScreen()
    
    init(isActive: Bool = false) {
        self.isActive = isActive
        if (defaults.string(forKey: "User_Refresh_Token") != nil){
            self.hasToken = true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                ZStack{
                    AppColorConstants.backgroundColor
                }
                .edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    Image("Spotify_Icon_RGB_Green")
                        .resizable()
                        .frame(width: 256, height: 256)
                    Text("Spotify Janitor")
                        .font(Font.custom("Poppins-ExtraBold", size: 40))
                        .foregroundColor(Color.init(hex: "1DB954"))
                    if(hasToken){
                        NavigationLink(destination: main,
                                       isActive: $isActive,
                                       label: { EmptyView() })
                    }else{
                        NavigationLink(destination: login,
                                       isActive: $isActive,
                                       label: { EmptyView() })
                    }
                }
                .onAppear(perform: {
                    if(hasToken){
                        continueToMainScreen(time: 2.5)
                    }else{
                        continueToLoginScreen(time: 2.5)
                    }
                })
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func continueToLoginScreen(time: Double){
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
    
    func continueToMainScreen(time: Double){
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
            let refreshToken : String = defaults.string(forKey: "User_Refresh_Token")!
            NetworkManager.shared.requestNewAccessTokenWithRefreshToken(refreshToken: refreshToken)
        }
    }
}
