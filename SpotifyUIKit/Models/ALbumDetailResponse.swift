//
//  ALbumDetailResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import Foundation

struct ALbumDetailResponse : Codable {
    let albumType: String
    let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let name: String
    let artists: [ArtistModel]
    let tracks: TrackResponse1
}

struct TrackResponse1 : Codable{
    let items: [Track]
}

struct Item1: Codable {
    let artists: [ArtistModel]
//    let discNumber: Int
//    let explicit: Bool
//    let externalUrls: APIExternalUrls
    let name: String
}
//struct Artist : Codable {
//    let externalUrls: APIExternalUrls
//    let id: String
//    let name: String?
//}
