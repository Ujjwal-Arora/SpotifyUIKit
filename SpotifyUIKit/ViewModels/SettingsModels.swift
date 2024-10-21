//
//  SettingsModels.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 19/10/24.
//

import Foundation

struct SettingsSection {
    let title : String
    let options : [Option]
}

struct Option{
    let title : String
    let handler : () async -> Void
}
