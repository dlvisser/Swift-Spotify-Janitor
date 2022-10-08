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
            AsyncImage(url: URL(string: track.album.images[1].url)){ image in image.resizable()} placeholder: {
                ProgressView()
            }
            .frame(width: 128, height: 128)
            VStack(alignment: .leading){
                Text(track.name)
                    .font(Font.custom("Poppins-ExtraBold", size: 16))
                    .lineLimit(1)
                Text(track.album.artists[0].name)
                    .font(Font.custom("Poppins-Regular", size: 16))
                    .foregroundColor(.gray)
                Spacer()
                HStack{
                    Button(action: {openSpotifyLink(albumUri: track.uri)}){
                        HStack{
                            Image("Spotify_Icon_RGB_White")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("Open Spotify")
                                .font(Font.custom("Poppins-ExtraBold", size: 12))
                                .foregroundColor(AppColorConstants.spotifyWhiteColor)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 6.0/*@END_MENU_TOKEN@*/)
                    }
                    .background(AppColorConstants.spotifyGreenColor)
                    .cornerRadius(40)
                    Spacer()
                    Button(action: {alertUserUponDeletion()}){
                        Image("remove")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(AppColorConstants.spotifyWhiteColor)
                            .padding(.all, 6.0)
                    }
                    .alert(isPresented: $isAlerted){
                        Alert(title: Text("Confirm Deletion"),message: Text("Are you sure you want to remove: \n\(track.name)") , primaryButton: .destructive(Text("Delete")){callForSpotifyItemDeletion(itemIDToRemove: track.id)} , secondaryButton: .cancel())
                    }
                    .background(AppColorConstants.appRedColor)
                    .cornerRadius(20)
                }
                .padding(.trailing)
            }
            .padding(.leading)
            Spacer()
        }
        .frame(height: 128)
        .padding(.bottom, 4.0)
    }
    
    func callForSpotifyItemDeletion(itemIDToRemove : String){
        // TODO: give user feedback of success.
        NetworkManager.shared.removeItemFromSpotifyAccount(endpoint: "me/tracks", itemIDToRemove: itemIDToRemove)
    }
    
    func alertUserUponDeletion(){
        isAlerted = true
    }
    
    func openSpotifyLink(albumUri : String){
        UIApplication.shared.open(URL(string:albumUri)!)
    }
}

struct TrackRow_Previews: PreviewProvider {
    static var trackItems = ModelData().trackResponse.tItems
    
    static var previews: some View {
        TrackRow(track: trackItems[0].track)
            .environmentObject(ModelData())
    }
}
