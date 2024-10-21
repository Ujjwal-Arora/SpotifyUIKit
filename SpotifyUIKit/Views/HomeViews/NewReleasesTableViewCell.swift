//
//  NewReleasesTableViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import UIKit

class NewReleasesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    weak var delegate : NewReleasesTableViewCellDelegate?
    
    private var albums = [Album]()
    
    static let identifier = "NewReleasesTableViewCell"
    
    private let NewReleasesCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 160, height: 200)
        layout.minimumLineSpacing = 15
        layout.sectionInset = .zero
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .purple
        collectionView.register(NewReleasesCollectionViewCell.self, forCellWithReuseIdentifier: NewReleasesCollectionViewCell.identifier)
        return collectionView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(NewReleasesCollectionView)
        NewReleasesCollectionView.delegate = self //why these
        NewReleasesCollectionView.dataSource = self //why these
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NewReleasesCollectionView.frame = contentView.bounds
    }
    public func configure(viewModel : [Album]){
        self.albums = viewModel
        DispatchQueue.main.async {
            self.NewReleasesCollectionView.reloadData()
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewReleasesCollectionViewCell.identifier, for: indexPath) as? NewReleasesCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(viewModel: albums[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedAlbumId  = albums[indexPath.row].id
        
        delegate?.didSelectAlbum(albumId: selectedAlbumId)

    }
    
}
protocol NewReleasesTableViewCellDelegate : AnyObject {
    func didSelectAlbum(albumId : String)
}
