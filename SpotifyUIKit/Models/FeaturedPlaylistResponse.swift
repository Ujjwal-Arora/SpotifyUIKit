//
//  FeaturedPlaylistResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 19/10/24.
//

import Foundation


struct FeaturedPlaylistResponse: Codable {
    let playlists: Playlists
}

struct Playlists: Codable {
    let items: [Playlist]
}

struct Playlist : Codable {
    let description: String
    let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let name: String
    let owner: Owner
}

struct Owner : Codable {
    let externalUrls: APIExternalUrls
    let id, displayName: String
}
