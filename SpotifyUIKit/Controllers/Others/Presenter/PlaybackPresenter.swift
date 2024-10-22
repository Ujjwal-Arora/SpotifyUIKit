//
//  PlaybackPresenter.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 22/10/24.
//

import Foundation
import UIKit

protocol PlayerDataSource : AnyObject{
    var songName : String? {get}
    var subtitle : String? {get}
    var imageUrl : URL? {get}
}

final class PlaybackPresenter {
    
    static let shared = PlaybackPresenter()
    
    private var track : Track?
    private var tracks = [Track]()
    var currentTrack : Track? {
        if let track = track, tracks.isEmpty{
            return track
        }else if !tracks.isEmpty {
            return tracks.first
        }
        return nil
    }
    
    func startPlayback(viewcontroller: UIViewController, track : Track){
        self.track = track
        self.tracks = []
        let vc = PlayerViewController()
        vc.title = track.name
        vc.dataSource = self
        viewcontroller.present(UINavigationController(rootViewController: vc), animated: true)
    }

}
extension PlaybackPresenter: PlayerDataSource{
    var songName: String? {
        currentTrack?.name
    }
    
    var subtitle: String? {
        currentTrack?.artists.first?.name
    }
    
    var imageUrl: URL? {
        URL(string: currentTrack?.album?.images.first?.url ?? "")
    }
    
    
}
