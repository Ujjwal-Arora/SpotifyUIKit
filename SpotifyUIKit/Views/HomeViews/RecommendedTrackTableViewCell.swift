//
//  RecommendedTrackTableViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import UIKit

class RecommendedTrackTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    static let identifier = "RecommendedTrackTableViewCell"
    
    private var recommendedTracks = [Track]()
    
    let recommendedTrackCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 180, height: 70)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .cyan
        collectionView.register(RecommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    public func configure(viewModel : [Track]){
        self.recommendedTracks = viewModel
        DispatchQueue.main.async {
            self.recommendedTrackCollectionView.reloadData()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(recommendedTrackCollectionView)
        
        recommendedTrackCollectionView.delegate = self
        recommendedTrackCollectionView.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        recommendedTrackCollectionView.frame = contentView.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendedTracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier, for: indexPath) as? RecommendedTrackCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(track: recommendedTracks[indexPath.row])
        
        return cell
    }
    
    
    
    
    
}
