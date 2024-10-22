//
//  SearchResultViewModel.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 22/10/24.
//

import Foundation

enum SearchResultViewModel {
    case artist(model : Artist)
    case album(model : Album)
    case track(model : Track)
}
