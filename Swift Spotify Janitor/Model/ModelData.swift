//
//  ModelData.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 28/08/2022.
//

import Foundation
import Combine

final class ModelData : ObservableObject{
    @Published var albumResponse : AlbumResponse = AlbumResponse.sample
    @Published var accountInfo : ProfileData = ProfileData.sample
    @Published var userAuthToken : String = "Empty"
    
    func loadProfileData() {
        guard let url = URL(string: "https://api.spotify.com/v1/me") else{
            print ("Failed to create URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(NetworkManager.shared.accessToken.accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                         guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                             throw URLError(.badServerResponse)
                         }
                         return output.data
                     }
            .decode(type: ProfileData.self, decoder: JSONDecoder())
            .retry(3)
            .replaceError(with: ProfileData.sample)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$accountInfo)
    }
    
    func loadAlbumData() {
        guard let url = URL(string: "https://api.spotify.com/v1/me/albums") else{
            print ("Failed to create URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(NetworkManager.shared.accessToken.accessToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                         guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                             throw URLError(.badServerResponse)
                         }
                         return output.data
                     }
            .decode(type: AlbumResponse.self, decoder: JSONDecoder())
            .retry(3)
            .replaceError(with: AlbumResponse.sample)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .assign(to: &$albumResponse)
    }
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
