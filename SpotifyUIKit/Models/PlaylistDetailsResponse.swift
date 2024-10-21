//
//  PlaylistDetailsResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import Foundation

struct PlaylistDetailsResponse  : Codable {
    let description: String
    let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let name: String
    let owner: Owner
    let tracks: TrackResponse
}

