//
//  AlbumList.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 28/08/2022.
//

import SwiftUI

struct TrackList: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        ScrollView{
            ForEach(modelData.trackResponse.tItems.reversed(), id: \.track.id){ trackItem in
                TrackRow(track: trackItem.track)
            }
            .navigationTitle("Tracks")
        }
    }
}

struct TrackList_Previews: PreviewProvider {
    static var previews: some View {
        TrackList()
            .environmentObject(ModelData())
    }
}
