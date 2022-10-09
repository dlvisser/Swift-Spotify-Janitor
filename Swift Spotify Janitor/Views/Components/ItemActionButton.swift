//
//  ItemActionButton.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 09/10/2022.
//

import Foundation
import SwiftUI

enum ItemActionType {
    case OpenSpotify
    case Delete
}

struct ItemActionButton : View{
    
    @State var isAlerted = false
    let type : ItemActionType
    var buttonAction : () -> ()
    var object : Any
    
    init(type: ItemActionType, buttonAction: @escaping () -> Void, object: Any) {
        self.type = type
        self.buttonAction = buttonAction
        self.object = object
    }
    
    var body: some View{
        switch(type){
        case .OpenSpotify:
            Button(action: {buttonAction()}) {
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
        case .Delete:
            Button(action: { alertUserUponDeletion()}) {
                Image("remove")
                    .resizable()
                    .frame(width: AppDimensionConstants.dimension24, height: AppDimensionConstants.dimension24)
                    .foregroundColor(AppColorConstants.spotifyWhiteColor)
                    .padding(.all, AppPaddingConstants.padding6)
            }
            .alert(isPresented: $isAlerted) {
                switch(object){
                case is Album:
                    let album : Album = object as! Album
                    return Alert(title: Text("Confirm Deletion"), message:
                                    Text("Are you sure you want to remove: \n\(album.name)"), primaryButton: .destructive(Text("Delete")) {
                        callForSpotifyItemDeletion(itemIDToRemove: album.id)
                    }, secondaryButton: .cancel())
                case is Track:
                    let track : Track = object as! Track
                    return Alert(title: Text("Confirm Deletion"), message:
                                    Text("Are you sure you want to remove: \n\(track.name)"), primaryButton: .destructive(Text("Delete")) {
                        callForSpotifyItemDeletion(itemIDToRemove: track.id)
                    }, secondaryButton: .cancel())
                default:
                    return Alert(title: Text("no"))
                }
            }
            .background(AppColorConstants.appRedColor)
            .cornerRadius(AppCornerRadiusConstants.cornerRadius20)
        }
    }
    
    func alertUserUponDeletion() {
        isAlerted = true
    }
    
    func callForSpotifyItemDeletion(itemIDToRemove: String) {
        // TODO: give user feedback of success.
        var endpoint : String = ""
        switch(object){
        case is Track:
            endpoint = "me/tracks"
        case is Album:
            endpoint = "me/albums"
        default:
            break
        }
        
        NetworkManager.shared.removeItemFromSpotifyAccount(endpoint: endpoint, itemIDToRemove: itemIDToRemove)
    }
}


struct ItemActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionButton(type: ItemActionType.Delete, buttonAction: {print("Hello")}, object: Track(uri: "", album: Album(albumType: "", artists: [Artist(id: "", name: "", type: "", uri: "")], id: "", name: "", uri: "", releaseDate: "", images: [ImageData(width: 0, url: "")]), popularity: 0, id: "", name: ""))
    }
}
