//
//  NetworkManager.swift
//  Swift Spotify Janitor
//
//  Created by Dave Visser on 19/09/2022.
//

import Foundation

class NetworkManager : ObservableObject{
    
    static let shared = NetworkManager()
    private var clientId : String = "db3571c8b48049b595fa9acb17be9d3a"
    private var clientSecret : String = "ceb077815ca042468eda09f6f6e8ee80"
    private var redirectUri : String = "swiftspotifyjanitor://callback"
    @Published var accessToken : AccessTokenResponse = AccessTokenResponse.sample
    
    func handleServerError(error: HTTPURLResponse){
        print(error)
    }
    
    func requestNewAccessTokenWithAuthToken(authToken : String){
        guard let tokenURL = URL(string: "https://accounts.spotify.com/api/token") else{
            print("Cannot create URL")
            return
        }
        
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [URLQueryItem(name: "grant_type", value: "authorization_code"),
                                            URLQueryItem(name: "code", value: authToken),
                                            URLQueryItem(name: "redirect_uri", value: redirectUri),
                                            URLQueryItem(name: "client_id", value: clientId),
                                            URLQueryItem(name: "client_secret", value: clientSecret)]
        
        var request = URLRequest(url: tokenURL)
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data
                else{
                    return
                }
                do{
                    self.accessToken = try JSONDecoder().decode(AccessTokenResponse.self, from: data)
                    print(self.accessToken.accessToken)
                }catch{
                    print("Access: \(self.accessToken.accessToken)")
                }
            }
        }
        task.resume()
        }
    
    func requestNewAccessTokenWithRefreshToken(refreshToken : String){
        guard let tokenURL = URL(string: "https://accounts.spotify.com/api/token") else{
            print("Cannot create URL")
            return
        }
        
        var requestBodyComponents = URLComponents()
        requestBodyComponents.queryItems = [URLQueryItem(name: "grant_type", value: "refresh_token"),
                                            URLQueryItem(name: "refresh_token", value: "\(refreshToken)"),
                                            URLQueryItem(name: "redirect_uri", value: redirectUri),
                                            URLQueryItem(name: "client_id", value: clientId),
                                            URLQueryItem(name: "client_secret", value: clientSecret)]
        
        var request = URLRequest(url: tokenURL)
        request.httpBody = requestBodyComponents.query?.data(using: .utf8)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data
                else{
                    return
                }
                do{
                    self.accessToken = try JSONDecoder().decode(AccessTokenResponse.self, from: data)
                    print("Refresh: \(self.accessToken.accessToken)")
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
        }
    
    func removeItemFromSpotifyAccount(endpoint: String, itemIDToRemove: String){
        guard let tokenURL = URL(string: "https://api.spotify.com/v1/\(endpoint)?ids=\(itemIDToRemove)") else{
            print("Cannot create URL")
            return
        }
                
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "DELETE"
        request.setValue("Bearer \(accessToken.accessToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data
                else{
                    return
                }
                do{
                    // TODO: give user feedback of success.
                    print("Deletion successfull of: \(itemIDToRemove)")
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
}
