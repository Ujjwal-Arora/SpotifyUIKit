//
//  ArtistModel.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import Foundation


struct ArtistModel  : Codable {
    let externalUrls: APIExternalUrls
    let id, name: String
}

