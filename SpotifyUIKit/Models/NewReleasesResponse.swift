//
//  NewReleasesResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 19/10/24.
//

import Foundation

struct NewReleasesResponse : Codable {
    let albums: Albums
}

struct Albums  : Codable {
    let items: [Album]
}
