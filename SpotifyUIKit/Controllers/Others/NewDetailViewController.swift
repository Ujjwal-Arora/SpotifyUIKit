////
////  NewDetailViewController.swift
////  SpotifyUIKit
////
////  Created by Ujjwal Arora on 22/10/24.
////
//
//import UIKit
//
//
////this is album/playllist/recommended detailVC
//
////make a header video part 12
////remove image if not present
//class NewDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    public var playlist : PlaylistDetailsResponse?
//    
//    public var genreplaylist : Playlist?
//
//    public var album : ALbumDetailResponse?
//    
//    public var detailsViewModel : DetailsViewModel?
//
//    
//
//    private let detailsTableView : UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(TracksTableViewCell.self, forCellReuseIdentifier: TracksTableViewCell.identifier)
//        return table
//    }()
////
////    init(playlist: PlaylistDetailsResponse) {
////        self.playlist = playlist
////        super.init(nibName: nil, bundle: nil)
////    }
////    required init?(coder: NSCoder) {
////        fatalError()
////    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .blue
//        view.addSubview(detailsTableView)
//        detailsTableView.delegate = self
//        detailsTableView.dataSource = self
//    }
//    override func viewDidLayoutSubviews() {
//        detailsTableView.backgroundColor = .systemPink
//        detailsTableView.frame = view.bounds
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if let selectecAlbum = album {
//            return selectecAlbum.tracks.items.count
//        }else if let selectedPlaylist = playlist{
//            return selectedPlaylist.tracks.items.count
//        }
////        else if let selectedGenrePlaylist = genreplaylist{
////            return selectedGenrePlaylist.
////        }
//        else if let selectedDetails = detailsViewModel{
//            return
//        }
//        
//        else{
//            return 1
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TracksTableViewCell.identifier, for: indexPath) as? TracksTableViewCell else { return UITableViewCell()}
//        
//        if let selectedAlbum = album{
//            let track = selectedAlbum.tracks.items[indexPath.row]
//            cell.configureAudioTrack(audioTrack: track)
//        }else if let selectedPLaylist = playlist{
//            let track = selectedPLaylist.tracks.items[indexPath.row].track
//            cell.configurePlaylist(Playlist: track)
//        }
//        
//        //        cell.configure(audioTrack: playlist.tracks.items[indexPath.row].track)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
//    
//    
//}
