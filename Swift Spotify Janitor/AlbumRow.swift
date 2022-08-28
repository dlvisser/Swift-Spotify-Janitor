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
            AsyncImage(url: URL(string: album.images[1].url)){ image in image.resizable()} placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            VStack(alignment: .leading){
                Text(album.name)
                    .font(.title.bold())
                    .lineLimit(1)
                Text(album.artists[0].name)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.bottom, -4.0)
        
        
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var albumItems = ModelData().albumResponse.aItems
    
    static var previews: some View {
        AlbumRow(album: albumItems[0].album)
            .environmentObject(ModelData())
    }
}
