//
//  AlbumList.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 28/08/2022.
//

import SwiftUI

struct AlbumList: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        ScrollView{
            ForEach(modelData.albumResponse.aItems, id: \.album.id){ albumItem in
                AlbumRow(album: albumItem.album)
            }
            .navigationTitle("Albums")
        }
        .onAppear(perform: { modelData.loadAlbumData()})
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
            .environmentObject(ModelData())
    }
}
