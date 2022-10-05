//
//  SplashScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 05/10/2022.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    let login = LoginScreen()

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
                    NavigationLink(destination: login,
                                   isActive: $isActive,
                                   label: { EmptyView() })
                }
                .onAppear(perform: {
                    self.gotoLoginScreen(time: 2.5)
                })
            }
        }
        .preferredColorScheme(.dark)
    }

    func gotoLoginScreen(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
}
