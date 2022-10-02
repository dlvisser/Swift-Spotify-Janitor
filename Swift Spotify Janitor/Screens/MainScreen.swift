//
//  MainScreen.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 01/10/2022.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView{
            VStack{
                ProfileTag()
                List{
                    Section("Favorites"){
                        NavigationLink(destination: AlbumList()){
                            Label("Albums", systemImage: "folder")
                        }
                    }
                }
            }
            .navigationTitle("").navigationBarHidden(true)
        }
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
