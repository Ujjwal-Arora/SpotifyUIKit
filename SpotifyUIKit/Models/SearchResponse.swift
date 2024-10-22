// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct SearchResponse : Codable {
    let albums: SearchAlbumResponse
    let artists: SearchArtistsResponse
    let tracks: SearchTracksResponse
}

struct SearchAlbumResponse : Codable {
    let items: [Album]
}

//// MARK: - AlbumElement
//struct AlbumElement {
//    let albumType: AlbumTypeEnum
//    let artists: [Artist]
//    let availableMarkets: [String]
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: String
//    let images: [Image]
//    let name, releaseDate: String
//    let releaseDatePrecision: ReleaseDatePrecision
//    let totalTracks: Int
//    let type: AlbumTypeEnum
//    let uri: String
//}
//
//enum AlbumTypeEnum: String {
//    case album
//    case single
//}
//
//// MARK: - Artist
//struct Artist {
//    let externalUrls: ExternalUrls
//    let href: String
//    let id, name: String
//    let type: ArtistType
//    let uri: String
//}

struct SearchArtistsResponse : Codable {
    let items: [Artist]
}

//// MARK: - ArtistsItem
//struct ArtistsItem {
//    let externalUrls: ExternalUrls
//    let followers: Followers
//    let genres: [String]
//    let href: String
//    let id: String
//    let images: [Image]
//    let name: String
//    let popularity: Int
//    let type: ArtistType
//    let uri: String
//}
//
//// MARK: - Followers
//struct Followers {
//    let href: NSNull
//    let total: Int
//}
//

struct SearchTracksResponse : Codable {
    let items: [Track]
}
//
//// MARK: - TracksItem
//struct TracksItem {
//    let album: AlbumElement
//    let artists: [Artist]
//    let availableMarkets: [String]
//    let discNumber, durationMS: Int
//    let explicit: Bool
//    let externalIDS: ExternalIDS
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: String
//    let isLocal: Bool
//    let name: String
//    let popularity: Int
//    let previewURL: String
//    let trackNumber: Int
//    let type, uri: String
//}
//
//// MARK: - ExternalIDS
//struct ExternalIDS {
//    let isrc: String
//}
