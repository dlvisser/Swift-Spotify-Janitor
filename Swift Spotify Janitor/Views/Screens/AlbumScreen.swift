//
//  AlbumScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 05/10/2022.
//

import SwiftUI

struct AlbumScreen: View {
    
    @State var expanded = true
    
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
                if(expanded) {
                    Text("Hi there! These albums miss you!")
                        .font(Font.custom("Poppins-ExtraBold", size: 32))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }
                Spacer()
                AlbumList()
                
            }
        }
        .gesture(DragGesture().onChanged{ value in
            if(value.translation.height > 0){
                expanded = true
            }else{
                expanded = false
            }
        })
        .animation(.easeIn, value: expanded)
        .preferredColorScheme(.dark)
    }
}

struct AlbumScreen_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            AlbumScreen()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}
