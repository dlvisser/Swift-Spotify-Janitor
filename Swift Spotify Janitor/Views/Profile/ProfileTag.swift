//
//  ProfileTag.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 30/08/2022.
//

import SwiftUI

struct ProfileTag: View {
    @EnvironmentObject var modelData : ModelData
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: modelData.accountInfo.images[0].url)){ image in image.resizable()} placeholder: {
                ProgressView()
            }.frame(width: 80, height: 80).clipShape(Circle()).overlay{Circle().stroke(.green.opacity(0.7), lineWidth: 4)}.padding([.vertical, .leading,]).shadow(radius: 10)
            VStack(alignment: .leading){
                Text(modelData.accountInfo.displayName.capitalized).font(.largeTitle.bold())
                Text(modelData.accountInfo.product.capitalized).font(.subheadline).foregroundColor(.gray)
            }.padding(.top)
            Spacer()
        }
        .onAppear(perform: { modelData.loadProfileData()})
    }
}

struct ProfileTag_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTag()
            .environmentObject(ModelData())
    }
}
