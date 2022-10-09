//
//  AlbumRow.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct TrackRow: View {
    var track: Track
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: track.album.images[1].url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: AppDimensionConstants.dimension128, height: AppDimensionConstants.dimension128)
            VStack(alignment: .leading) {
                Text(track.name)
                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppDimensionConstants.dimension16))
                    .lineLimit(1)
                Text(track.album.artists[0].name)
                    .font(Font.custom(AppFontNameConstants.poppinsRegular, size: AppDimensionConstants.dimension16))
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    ItemActionButton(type: ItemActionType.OpenSpotify, buttonAction: {openSpotifyLink(trackUri: track.uri)}, object: track)
                    Spacer()
                    ItemActionButton(type: ItemActionType.Delete, buttonAction: {}, object: track)
                }
                .padding(.trailing)
            }
            .padding(.leading)
            Spacer()
        }
        .frame(height: AppDimensionConstants.dimension128)
        .padding(.bottom, AppPaddingConstants.padding4)
    }
    
    func openSpotifyLink(trackUri: String) {
        UIApplication.shared.open(URL(string: trackUri)!)
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var trackItems = ModelData().trackResponse.tItems
    
    static var previews: some View {
        TrackRow(track: trackItems[0].track)
            .environmentObject(ModelData())
    }
}
