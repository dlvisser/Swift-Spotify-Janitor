//
//  ProfileScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 05/10/2022.
//

import SwiftUI

struct ProfileScreen: View {
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
                    .font(Font.custom("Poppins-ExtraBold", size: 32))
                    .multilineTextAlignment(.leading)
                ProfileTag()
                Spacer()
            }
            .padding(.horizontal)
        }
        .preferredColorScheme(.dark)
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
