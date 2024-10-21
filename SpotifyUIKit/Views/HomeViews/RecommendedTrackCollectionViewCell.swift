//
//  RecommendedTrackCollectionViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import UIKit
import SDWebImage

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendedTrackCollectionViewCell"
    
    let trackCoverImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let trackAlbumLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let trackArtistLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
  //      label.textColor = .secondaryLabel
        return label
    }()
    
    public func configure(track : Track){
        guard let urlString = track.album.images.first?.url else { return }
        trackCoverImageView.sd_setImage(with: URL(string: urlString))
        
        trackAlbumLabel.text = track.album.name
        trackArtistLabel.text = track.artists.first?.name ?? "no artist"
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        contentView.addSubview(trackCoverImageView)
        contentView.addSubview(trackAlbumLabel)
        contentView.addSubview(trackArtistLabel)

        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func applyConstraints(){
        let trackCoverImageViewConstraints = [
            trackCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            trackCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            trackCoverImageView.widthAnchor.constraint(equalToConstant: contentView.height),
            trackCoverImageView.heightAnchor.constraint(equalToConstant: contentView.height)
            
        ]
        
        let trackAlbumLabelConstraints = [
            trackAlbumLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            trackAlbumLabel.leadingAnchor.constraint(equalTo: trackCoverImageView.trailingAnchor, constant: 10),
            trackAlbumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            trackAlbumLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)

        ]
        
        let trackArtistLabelConstraints = [
            trackArtistLabel.topAnchor.constraint(equalTo: trackAlbumLabel.bottomAnchor, constant: 0),
            trackArtistLabel.leadingAnchor.constraint(equalTo: trackCoverImageView.trailingAnchor, constant: 10),
            trackArtistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),

            trackArtistLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)

        ]
        
        
        NSLayoutConstraint.activate(trackCoverImageViewConstraints)
        NSLayoutConstraint.activate(trackAlbumLabelConstraints)
        NSLayoutConstraint.activate(trackArtistLabelConstraints)

    }
    
}
  
 
