//
//  ViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewReleasesTableViewCellDelegate, FeaturedPlaylistTableViewCellDelegate {
    
    
    var newReleases = [Album]()
    var featuredPlaylists = [Playlist]()
    var recommendedTracks = [Track]()
    
    //use this seeing netflix app
    let sectionTitles = ["New Releases","Featured Playlists","Recommended Tracks"]
    
    private var homeViewTable : UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .orange
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(NewReleasesTableViewCell.self, forCellReuseIdentifier: NewReleasesTableViewCell.identifier)
        table.register(RecommendedTrackTableViewCell.self, forCellReuseIdentifier: RecommendedTrackTableViewCell.identifier)
        table.register(FeaturedPlaylistTableViewCell.self, forCellReuseIdentifier: FeaturedPlaylistTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchData()
        
        DispatchQueue.main.async {
            self.homeViewTable.reloadData()
        }
        
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        
        view.addSubview(homeViewTable)
        homeViewTable.delegate = self
        homeViewTable.dataSource = self
    }
    override func viewDidLayoutSubviews() {
        homeViewTable.frame = view.bounds
    }
    
    //makethis func for recommendedSection
    func didSelectAlbum(albumId: String) {
        Task{
//            let albumDetails = try await APICaller.shared.getAlbum(albumId: albumId)
//            let vc = AlbumDetailsViewController(album: albumDetails)
//            vc.title = albumDetails.name
//            navigationController?.pushViewController(vc, animated: true)
//            
            let albumDetails = try await APICaller.shared.getAlbum(albumId: albumId)
            let vc = DetailsViewController()
            vc.album = albumDetails
            vc.title = albumDetails.name
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    func didSelectPlaylist(selectedPlaylistId: String) {
        Task{
//            let playlistDetails = try await APICaller.shared.getPlaylist(playlistId: selectedPlaylistId)
//            let vc = PlaylistDetailViewController(playlist: playlistDetails)
//            vc.title = playlistDetails.name
//            navigationController?.pushViewController(vc, animated: true)
            
            let playlistDetails = try await APICaller.shared.getPlaylist(playlistId: selectedPlaylistId)
            let vc = DetailsViewController()
            vc.playlist = playlistDetails
            vc.title = playlistDetails.name
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func didTapSettings(){
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: NewReleasesTableViewCell.identifier, for: indexPath) as? NewReleasesTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .purple
            
            cell.delegate = self
            
            cell.configure(viewModel: newReleases)
            return cell
        case 2 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTrackTableViewCell.identifier, for: indexPath) as? RecommendedTrackTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .purple
            
            cell.configure(viewModel: recommendedTracks)
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeaturedPlaylistTableViewCell.identifier, for: indexPath) as? FeaturedPlaylistTableViewCell else { return UITableViewCell() }
            cell.backgroundColor = .blue
            
            cell.delegate = self

            cell.configure(playlists: featuredPlaylists)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .systemPink
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    func fetchData(){
        Task{
//            async let newReleasesResponse =  APICaller.shared.getNewReleases()
//            async let featuredPlaylistResponse = APICaller.shared.getFeaturesPlaylist()
//            async let RecommendationsResponse = APICaller.shared.getRecommendations()
//            try await print("🐷",RecommendationsResponse)
//            
//            self.newReleases = try await  newReleasesResponse.albums.items
//                       print("🚫", self.newReleases)
//
//            self.featuredPlaylists = try await featuredPlaylistResponse.playlists.items
//                       print("🚫", self.featuredPlaylists)
//            
//           self.recommendedTracks = try await RecommendationsResponse.tracks
//                      print("🎧", self.recommendedTracks)
            
            DispatchQueue.main.async {
                self.homeViewTable.reloadData()
            }
            
        }
    }
}

