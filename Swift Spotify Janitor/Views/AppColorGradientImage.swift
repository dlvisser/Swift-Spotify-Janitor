//
//  AppColorGradientImage.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 09/10/2022.
//

import SwiftUI

struct AppColorGradientImage: View {
    
    let imageName : String
    let imageWidth : CGFloat
    let imageHeight : CGFloat
    
    init(imageName: String, imageWidth: CGFloat, imageHeight: CGFloat) {
        self.imageName = imageName
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    
    var body: some View {
        ZStack {
            Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageWidth, height: imageHeight)
                    .clipped()
                    .clipShape(Rectangle())
            Rectangle()
                    .frame(width: imageWidth, height: imageWidth)
                    .foregroundStyle(AppColorConstants.imageGradient)
        }
    }
}

struct AppColorGradientImage_Previews: PreviewProvider {
    static var previews: some View {
        AppColorGradientImage(imageName: "taya-iv-sBr-g8wJw5k-unsplash", imageWidth: AppDimensionConstants.dimension256, imageHeight: AppDimensionConstants.dimension256)
    }
}
