//
//  AlbumRow.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 25/08/2022.
//

import SwiftUI

struct AlbumRow: View {
    var body: some View {
        HStack() {
            Image("Spotify_Icon_RGB_Green")
                .resizable()
                .frame(width: 50, height: 50)
            .padding()
            VStack(alignment: .leading){
                Text("Title")
                    .font(.title)
                Text("Artist")
                    .font(.subheadline)
            }
            Spacer()
        }
        
        
    }
}

struct AlbumRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRow()
    }
}
