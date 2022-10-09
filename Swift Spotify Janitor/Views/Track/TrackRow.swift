//
//  AlbumRow.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct TrackRow: View {
    var track: Track
    @State var isAlerted = false

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
                    Button(action: { openSpotifyLink(albumUri: track.uri) }) {
                        HStack {
                            Image("Spotify_Icon_RGB_White")
                                    .resizable()
                                    .frame(width: AppDimensionConstants.dimension24, height: AppDimensionConstants.dimension24)
                            Text("Open Spotify")
                                    .font(Font.custom(AppFontNameConstants.poppinsExtraBold, size: AppFontSizeConstants.fontSize12))
                                    .foregroundColor(AppColorConstants.spotifyWhiteColor)
                        }
                                .padding(.all, AppPaddingConstants.padding6)
                    }
                            .background(AppColorConstants.spotifyGreenColor)
                            .cornerRadius(AppCornerRadiusConstants.cornerRadius40)
                    Spacer()
                    Button(action: { alertUserUponDeletion() }) {
                        Image("remove")
                                .resizable()
                                .frame(width: AppDimensionConstants.dimension24, height: AppDimensionConstants.dimension24)
                                .foregroundColor(AppColorConstants.spotifyWhiteColor)
                                .padding(.all, AppPaddingConstants.padding6)
                    }
                            .alert(isPresented: $isAlerted) {
                                Alert(title: Text("Confirm Deletion"), message: Text("Are you sure you want to remove: \n\(track.name)"), primaryButton: .destructive(Text("Delete")) {
                                    callForSpotifyItemDeletion(itemIDToRemove: track.id)
                                }, secondaryButton: .cancel())
                            }
                            .background(AppColorConstants.appRedColor)
                            .cornerRadius(AppCornerRadiusConstants.cornerRadius20)
                }
                        .padding(.trailing)
            }
                    .padding(.leading)
            Spacer()
        }
                .frame(height: AppDimensionConstants.dimension128)
                .padding(.bottom, AppPaddingConstants.padding4)
    }

    func callForSpotifyItemDeletion(itemIDToRemove: String) {
        // TODO: give user feedback of success.
        NetworkManager.shared.removeItemFromSpotifyAccount(endpoint: "me/tracks", itemIDToRemove: itemIDToRemove)
    }

    func alertUserUponDeletion() {
        isAlerted = true
    }

    func openSpotifyLink(albumUri: String) {
        UIApplication.shared.open(URL(string: albumUri)!)
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var trackItems = ModelData().trackResponse.tItems

    static var previews: some View {
        TrackRow(track: trackItems[0].track)
                .environmentObject(ModelData())
    }
}
