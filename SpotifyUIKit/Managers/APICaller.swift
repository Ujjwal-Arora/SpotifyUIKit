//
//  APICaller.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfile() async throws -> UserProfileModel {
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        
        guard let url = URL(string: "https://api.spotify.com/v1/me") else { throw URLError(.badURL) }
        var request = URLRequest(url : url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,_) = try await URLSession.shared.data(for: request)
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(UserProfileModel.self, from: data)
            print("😍",result)
            return result
        }catch{
            print("❤️",error.localizedDescription)
            throw error
        }
    }
    public func getNewReleases() async throws -> NewReleasesResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/browse/new-releases?limit=10") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,_) = try await URLSession.shared.data(for: request)
        //print(String(data: data, encoding: .utf8))
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(NewReleasesResponse.self, from: data)
        //      print("☠️",response)
        return response
        
    }
    //    curl --request GET \
    //      --url https://api.spotify.com/v1/browse/featured-playlists \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    public func getFeaturesPlaylist() async throws -> FeaturedPlaylistResponse{
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/browse/featured-playlists?limit=10") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,_) = try await URLSession.shared.data(for: request)
        //       print(String(data: data, encoding: .utf8))
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FeaturedPlaylistResponse.self, from: data)
        //        print("🤡",response)
        return response
        
    }
    //    curl --request GET \
    //      --url 'https://api.spotify.com/v1/recommendations?limit=1&seed_genres=classical%2Ccountry' \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    
    public func getRecommendations() async throws -> RecommendationsResponse{
        
        let userGenres = try await APICaller.shared.getGenresForRecommendations().genres
        
        let randomGenres = Array(userGenres.shuffled().prefix(5))
        let seeds = randomGenres.joined(separator: "%2C")
        print("🌞",seeds)
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/recommendations?limit=8&seed_genres=\(seeds)") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,resp) = try await URLSession.shared.data(for: request)
        //         print("🌸",String(data: data, encoding: .utf8))
        print("🐥",resp)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(RecommendationsResponse.self, from: data)
        //        print("🦋",response)
        return response
    }
    //    curl --request GET \
    //      --url https://api.spotify.com/v1/recommendations/available-genre-seeds \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    public func getGenresForRecommendations() async throws -> GenresForRecommendationsResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/recommendations/available-genre-seeds") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,resp) = try await URLSession.shared.data(for: request)
        //           print(String(data: data, encoding: .utf8))
        print("🐬",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(GenresForRecommendationsResponse.self, from: data)
        //       print("🌈",response)
        return response
    }
    
    
    //    curl --request GET \
    //      --url https://api.spotify.com/v1/albums/4aawyAB9vmqN3uQ7FjRGTy \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    
    public func getAlbum(albumId : String ) async throws -> ALbumDetailResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/albums/\(albumId)") else { throw URLError(.badURL) }
        //  https://api.spotify.com/v1/albums/\(albumId)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,resp) = try await URLSession.shared.data(for: request)
        //               print(String(data: data, encoding: .utf8))
        //        print("🎲",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(ALbumDetailResponse.self, from: data)
        print("🎲",response)
        return response
    }
    //    curl --request GET \
    //      --url https://api.spotify.com/v1/playlists/3cEYpjA9oz9GiPac4AsH4n \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    public func getPlaylist(playlistId : String ) async throws -> PlaylistDetailsResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/playlists/\(playlistId)") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,_) = try await URLSession.shared.data(for: request)
        //          print(String(data: data, encoding: .utf8))
 //         print("🥎",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(PlaylistDetailsResponse.self, from: data)
        print("🥎",response)
        return response
    }
    //    curl --request GET \
    //      --url 'https://api.spotify.com/v1/browse/categories?limit=12' \
    //      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    
    public func getCategories() async throws -> CategoriesResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/browse/categories?limit=12") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,_) = try await URLSession.shared.data(for: request)
    //    print(String(data: data, encoding: .utf8))
        //  print("🏀",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(CategoriesResponse.self, from: data)
//       print("🏀",response)
        return response
    }
//    curl --request GET \
//      --url https://api.spotify.com/v1/browse/categories/0JQ5DAqbMKFKSopHMaeIeI/playlists \
//      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    
    public func getCategoryPlaylist(playlistId : String) async throws -> FeaturedPlaylistResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/browse/categories/\(playlistId)/playlists") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,resp) = try await URLSession.shared.data(for: request)
      //  print(String(data: data, encoding: .utf8))
        //  print("🏓",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(FeaturedPlaylistResponse.self, from: data)
 //       print("🏓",response)
        return response
    }
//    curl --request GET \
//      --url 'https://api.spotify.com/v1/search?q=raftaar&type=album%2Cplaylist&limit=5' \
//      --header 'Authorization: Bearer 1POdFZRZbvb...qqillRxMr2z'
    public func searchResults(query : String) async throws -> SearchResponse {
        
        guard let accessToken = AuthManager.shared.accessToken else { throw URLError(.userAuthenticationRequired) }
        guard let url = URL(string: "https://api.spotify.com/v1/search?q=raftaar&type=album%2Cplaylist&limit=5") else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        let (data,resp) = try await URLSession.shared.data(for: request)
     //   print(String(data: data, encoding: .utf8))
        //  print("💎",resp)
        
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(SearchResponse.self, from: data)
        print("💎",response)
        return response
    }
}
