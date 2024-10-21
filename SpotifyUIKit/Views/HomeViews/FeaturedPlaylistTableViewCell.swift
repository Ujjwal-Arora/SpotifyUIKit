//
//  FeaturedPlaylistTableViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import UIKit

class FeaturedPlaylistTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    weak var delegate : FeaturedPlaylistTableViewCellDelegate?

    static let identifier = "FeaturedPlaylistTableViewCell"
    
    private var playlists = [Playlist]()
    
    let featuredPlaylistCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 50) //size of each cell
    //    layout.minimumInteritemSpacing = CGFloat(1)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FeaturedPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    public func configure(playlists : [Playlist]){
        self.playlists = playlists
        DispatchQueue.main.async {
            self.featuredPlaylistCollectionView.reloadData()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(featuredPlaylistCollectionView)
        
        featuredPlaylistCollectionView.frame = contentView.bounds
        featuredPlaylistCollectionView.backgroundColor = .red
        
        
        featuredPlaylistCollectionView.delegate = self
        featuredPlaylistCollectionView.dataSource = self
    }
    override func layoutSubviews() {
        featuredPlaylistCollectionView.frame = contentView.bounds

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        playlists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedPlaylistCollectionViewCell.identifier, for: indexPath) as? FeaturedPlaylistCollectionViewCell else {return UICollectionViewCell()}
        
        cell.configure(playlist: playlists[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedPlaylistId = playlists[indexPath.row].id
        delegate?.didSelectPlaylist(selectedPlaylistId: selectedPlaylistId)
        
    }
}
protocol FeaturedPlaylistTableViewCellDelegate : AnyObject {
    func didSelectPlaylist(selectedPlaylistId : String)
}
