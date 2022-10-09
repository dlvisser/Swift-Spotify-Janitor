//
//  ProfileTag.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 30/08/2022.
//

import SwiftUI

struct ProfileTag: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: modelData.accountInfo.images[0].url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                    .frame(width: AppDimensionConstants.dimension128, height: AppDimensionConstants.dimension128)
            VStack(alignment: .leading) {
                Text(modelData.accountInfo.displayName.capitalized).font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize16))
                Text(modelData.accountInfo.product.capitalized).font(Font.custom(AppFontNameConstants.poppinsLight, size: AppFontSizeConstants.fontSize16)).foregroundColor(AppColorConstants.spotifyWhiteColor)
                Spacer()
                HStack {
                    VStack {
                        Text("Followers").font(Font.custom(AppFontNameConstants.poppinsLight, size: AppFontSizeConstants.fontSize16)).foregroundColor(AppColorConstants.spotifyWhiteColor)
                        Text("11").font(Font.custom(AppFontNameConstants.poppinsLight, size: AppFontSizeConstants.fontSize16)).foregroundColor(AppColorConstants.spotifyWhiteColor)
                    }
                }
            }
                    .padding(.leading)
            Spacer()
        }
                .frame(height: AppDimensionConstants.dimension128)
    }
}

struct ProfileTag_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTag()
                .environmentObject(ModelData())
                .preferredColorScheme(.dark)
    }
}
