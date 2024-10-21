//
//  CategoriesResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 21/10/24.
//

import Foundation

struct CategoriesResponse : Codable {
    let categories: Categories
}

struct Categories  : Codable{
    let items: [Category]
}

struct Category : Codable {
    let id: String
    let icons: [APIImage]
    let name: String
}
