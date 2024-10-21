//
//  AudioTrackModel.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import Foundation



struct TrackResponse  : Codable {
    let items: [AudioTrack]
}

struct AudioTrack  : Codable {
//    let addedBy: Owner
    let track: Track
}


struct Track: Codable {
    let album: Album
    let artists: [ArtistModel]
 //   let availableMarkets: [Any?]
    
    let discNumber: Int
    let durationMs: Int

    let explicit: Bool
    let externalUrls: APIExternalUrls
    let id, name: String
    let popularity: Int
}
