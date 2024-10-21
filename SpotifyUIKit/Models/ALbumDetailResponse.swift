//
//  ALbumDetailResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import Foundation

struct ALbumDetailResponse : Codable {
    let albumType: String
//    let availableMarkets: [String]
    let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let name: String
    let artists: [ArtistModel]
    let tracks: TrackResponse1
}

struct TrackResponse1 : Codable{
    let items: [Item1]
}

struct Item1: Codable {
    let artists: [Artist]
//    let availableMarkets: [String]
    let discNumber: Int
    let explicit: Bool
    let externalUrls: APIExternalUrls
    let name: String
}
struct Artist : Codable {
    let externalUrls: APIExternalUrls
    let id: String
    let name: String?
}
