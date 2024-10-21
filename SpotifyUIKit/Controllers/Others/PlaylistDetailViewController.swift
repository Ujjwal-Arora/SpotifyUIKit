////
////  PlaylistDetailViewController.swift
////  SpotifyUIKit
////
////  Created by Ujjwal Arora on 21/10/24.
////
//
//import UIKit
//
//class PlaylistDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    private let playlist : PlaylistDetailsResponse
//    
//    private let playlistTableView : UITableView = {
//        let table = UITableView(frame: .zero, style: .grouped)
//        table.register(TracksTableViewCell.self, forCellReuseIdentifier: TracksTableViewCell.identifier)
//        return table
//    }()
//    
//    init(playlist: PlaylistDetailsResponse) {
//        self.playlist = playlist
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .blue
//        view.addSubview(playlistTableView)
//        playlistTableView.delegate = self
//        playlistTableView.dataSource = self
//    }
//    override func viewDidLayoutSubviews() {
//        playlistTableView.backgroundColor = .systemPink
//        playlistTableView.frame = view.bounds
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        playlist.tracks.items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: TracksTableViewCell.identifier, for: indexPath) as? TracksTableViewCell else { return UITableViewCell()}
// //       cell.configure(audioTrack: playlist.tracks.items[indexPath.row].track)
//        return cell
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        100
//    }
//
//
//}
