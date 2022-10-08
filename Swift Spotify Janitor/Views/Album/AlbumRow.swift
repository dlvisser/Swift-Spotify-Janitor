//
//  AlbumRow.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct AlbumRow: View {
    var album: Album
    @State var isAlerted = false
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: album.images[1].url)){ image in image.resizable()} placeholder: {
                ProgressView()
            }
            .frame(width: 128, height: 128)
            VStack(alignment: .leading){
                Text(album.name)
                    .font(Font.custom("Poppins-ExtraBold", size: 16))
                    .lineLimit(1)
                Text(album.artists[0].name)
                    .font(Font.custom("Poppins-Regular", size: 16))
                    .foregroundColor(.gray)
                Spacer()
                HStack{
                    Button(action: {openSpotifyLink(albumUri: album.uri)}){
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
                    }.alert(isPresented: $isAlerted){
                        Alert(title: Text("Confirm Deletion"),message: Text("Are you sure you want to remove: \n\(album.name)") , primaryButton: .destructive(Text("Delete")){print("Deleted: \(album.name)")} , secondaryButton: .cancel())
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
    
    func alertUserUponDeletion(){
        isAlerted = true
    }
    
    func openSpotifyLink(albumUri : String){
        UIApplication.shared.open(URL(string:albumUri)!)
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var albumItems = ModelData().albumResponse.aItems
    
    static var previews: some View {
        AlbumRow(album: albumItems[0].album)
            .environmentObject(ModelData())
    }
}
