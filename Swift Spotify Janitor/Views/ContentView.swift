//
//  ContentView.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(DevelopmentConstant.previewdevices, id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
