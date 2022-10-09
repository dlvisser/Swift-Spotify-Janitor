//
//  GradientTopBox.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 09/10/2022.
//

import SwiftUI

struct GradientTopBox: View {
    var body: some View {
        ZStack(alignment: .top) {
            AppColorConstants.backgroundColor
            GeometryReader { geo in
                Rectangle()
                        .fill(AppColorConstants.backgroundGradient)
                        .frame(width: geo.size.width, height: geo.size.height / 3)
            }
        }
                .edgesIgnoringSafeArea(.all)
    }
}

struct GradientTopBox_Previews: PreviewProvider {
    static var previews: some View {
        GradientTopBox()
    }
}
