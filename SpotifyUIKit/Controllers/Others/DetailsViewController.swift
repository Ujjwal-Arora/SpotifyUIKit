//
//  DetailsViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 21/10/24.
//

import UIKit


//this is album/playllist detailVC

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public var playlist : PlaylistDetailsResponse?
    
    public var album : ALbumDetailResponse?
    
    private let detailsTableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(detailsTableView)
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        detailsTableView.backgroundColor = .systemBackground
        detailsTableView.frame = view.bounds
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let selectecAlbum = album {
            return selectecAlbum.tracks.items.count
        }else if let selectedPlaylist = playlist{
            return selectedPlaylist.tracks.items.count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell else { return UITableViewCell()}
        
        if let selectedAlbum = album{
            let track = selectedAlbum.tracks.items[indexPath.row]
            cell.configureAudioTrack(audioTrack: track)
        }else if let selectedPLaylist = playlist{
            let track = selectedPLaylist.tracks.items[indexPath.row].track
            cell.configurePlaylist(Playlist: track)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var selectedTrack : Track?
        
        if let selectedAlbum = album {
            selectedTrack = selectedAlbum.tracks.items[indexPath.row]
        } else if let selectedPlaylist = playlist {
            selectedTrack = selectedPlaylist.tracks.items[indexPath.row].track
        }
        guard let track = selectedTrack else { return }
        
        PlaybackPresenter.shared.startPlayback(viewcontroller: self, track: track)
    }
    
}
