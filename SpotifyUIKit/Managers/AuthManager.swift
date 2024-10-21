//
//  AuthManager.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import Foundation

struct Constants{
    static let clientID = "6ef3f300606c48bd9f1a2004ac063342"
    
    static let clientSecret = "89db4457dda64d7c865bef5b9ed1939f"
    
    static let tokenApiUrl = "https://accounts.spotify.com/api/token"
    
    static let redirectUri =  "https://open.spotify.com/"

    static let scope = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"

}

final class AuthManager{
    static let shared = AuthManager()
    
    private init(){}
    
    public var signInUrl : URL? {
        let baseUrl = "https://accounts.spotify.com/authorize?"
        let state = UUID().uuidString
        
        let url = URL(string: "\(baseUrl)response_type=code&client_id=\(Constants.clientID)&scope=\(Constants.scope)&redirect_uri=\(Constants.redirectUri)&state=\(state)&show_dialogue=TRUE")
        
        return url
    }
    
    var isSignedIn : Bool{
        return accessToken != nil
    }
    
    public var accessToken : String?{
        return UserDefaults.standard.string(forKey: "accessToken")
    }
    public var refreshToken : String?{
        return UserDefaults.standard.string(forKey: "refreshToken")
    }
    private var tokenExpirationDate : Date?{
   //     print(UserDefaults.standard.object(forKey: "expirationDate") as?  Date)
        return UserDefaults.standard.object(forKey: "expirationDate") as?  Date
    }
    private var shouldRefreshToken : Bool{
        guard let expirationDate = tokenExpirationDate else { return false }
            let currentDate = Date()
            let fiveMinutes : TimeInterval = 300
        if currentDate.addingTimeInterval(fiveMinutes) >= expirationDate {
            return true
        }else{
            return false
        }
        
    }
    public func exchangeCodeForToken(code : String) async throws{
        guard let url = URL(string: Constants.tokenApiUrl) else {return}
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectUri)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = urlComponents.query?.data(using: .utf8)
        
        let basicTokem = Constants.clientID+":"+Constants.clientSecret
        let data = basicTokem.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Cant convert to base64")
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let (jsonData,_) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(AuthResponse.self, from: jsonData)
        print("🌿",result)
        self.cacheToken(result : result)
    }
    
    public func refreshIfNeeded() async throws{
        guard self.shouldRefreshToken, let refreshToken = self.refreshToken else {return}
                
        guard let url = URL(string: Constants.tokenApiUrl) else {return}
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [
            URLQueryItem(name: "grant_type", value: "refresh_token"),
            URLQueryItem(name: "refresh_token", value: refreshToken)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = urlComponents.query?.data(using: .utf8)
        
        let basicTokem = Constants.clientID+":"+Constants.clientSecret
        let data = basicTokem.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Cant convert to base64")
            return
        }
        request.setValue("Basic \(base64String)", forHTTPHeaderField: "Authorization")
        
        let (jsonData,_) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try decoder.decode(AuthResponse.self, from: jsonData)
        print("👻",result)
        self.cacheToken(result : result)
        
    }
    public func cacheToken(result : AuthResponse){
        UserDefaults.standard.setValue(result.accessToken, forKey: "accessToken")
        
        if result.refreshToken != nil{
            UserDefaults.standard.setValue(result.refreshToken, forKey: "refreshToken")
        }
        
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expiresIn)), forKey: "expirationDate")
//        print(Date())
//        print("📝",result.expiresIn)
//        print("🤩",Date().addingTimeInterval(TimeInterval(result.expiresIn)))
    }
}
