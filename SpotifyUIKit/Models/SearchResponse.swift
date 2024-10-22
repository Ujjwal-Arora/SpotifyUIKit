// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct SearchResponse : Codable {
    let albums: SearchAlbumResponse
 //   let artists: SearchArtistsResponse
    let tracks: SearchTracksResponse
}

struct SearchAlbumResponse : Codable {
    let items: [Album]
}



struct SearchArtistsResponse : Codable {
    let items: [ArtistModel]
}


struct SearchTracksResponse : Codable {
    let items: [Track]
}
