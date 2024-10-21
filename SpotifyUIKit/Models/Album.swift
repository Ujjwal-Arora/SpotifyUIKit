//
//  Album.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 19/10/24.
//

import Foundation

struct Album  : Codable {
    let albumType: String
    let totalTracks: Int
 //   let availableMarkets: [String]
 //   let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let name, releaseDate: String
    let artists: [ArtistModel]
}
