//
//  LoginScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        VStack {
            Text("Swift Spotify Janitor")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle.bold())
                .padding(.horizontal)
            Spacer()
            Text(modelData.userAuthToken)
            Button(action: {
                UIApplication.shared.open(URL(string: "https://accounts.spotify.com/en/authorize?client_id=db3571c8b48049b595fa9acb17be9d3a&response_type=code&redirect_uri=swiftspotifyjanitor://callback&scope=user-read-email%20user-read-private%20user-library-read&show_dialog=true")!)
            })
            {
                Text("Press me")
                    .font(.title.bold())
                    .foregroundColor(.green)
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            LoginScreen()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
