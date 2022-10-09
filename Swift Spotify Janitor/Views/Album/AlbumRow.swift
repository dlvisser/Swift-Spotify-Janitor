//
//  AlbumRow.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct AlbumRow: View {
    var album: Album
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: album.images[1].url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: AppDimensionConstants.dimension128, height: AppDimensionConstants.dimension128)
            VStack(alignment: .leading) {
                Text(album.name)
                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize16))
                    .lineLimit(1)
                Text(album.artists[0].name)
                    .font(Font.custom(AppFontNameConstants.poppinsRegular, size: AppFontSizeConstants.fontSize16))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    ItemActionButton(type:
                                        ItemActionType.OpenSpotify, buttonAction: {openSpotifyLink(albumUri: album.uri)}, object: album)
                    Spacer()
                    ItemActionButton(type: ItemActionType.Delete, buttonAction: {}, object: album)
                }
                .padding(.trailing)
            }
            .padding(.leading)
            Spacer()
        }
        .frame(height: AppDimensionConstants.dimension128)
        .padding(.bottom, AppPaddingConstants.padding4)
    }
    
    func openSpotifyLink(albumUri: String) {
        UIApplication.shared.open(URL(string: albumUri)!)
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var albumItems = ModelData().albumResponse.aItems
    
    static var previews: some View {
        AlbumRow(album: albumItems[0].album)
            .environmentObject(ModelData())
    }
}
