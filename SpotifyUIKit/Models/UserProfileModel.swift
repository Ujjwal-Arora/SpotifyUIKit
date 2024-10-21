//
//  UserProfileModel.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 18/10/24.
//

import Foundation

struct UserProfileModel : Codable {
    
    let country, displayName, email: String
    let explicitContent: ExplicitContent
    let externalUrls: APIExternalUrls
    let id: String
    let images: [APIImage]
    let product: String
}

struct ExplicitContent : Codable {
    let filterEnabled, filterLocked: Bool
}
