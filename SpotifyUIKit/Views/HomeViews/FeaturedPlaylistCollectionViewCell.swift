//
//  FeaturedPlaylistCollectionViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 20/10/24.
//

import UIKit
import SDWebImage

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    private let playlistCoverImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private let playlistNameLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    private let playlistDescriptionLabel : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    public func configure(playlist : Playlist){
        guard let urlString = playlist.images.first?.url else { return }
        playlistCoverImageView.sd_setImage(with: URL(string: urlString))
        
        playlistNameLabel.text = playlist.name
        
        playlistDescriptionLabel.text = playlist.description
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(playlistDescriptionLabel)

        contentView.backgroundColor = .systemBackground
  
    }
    override func layoutSubviews() {
        
        playlistCoverImageView.frame = CGRect(x: 0, y: 0, width: contentView.height, height: contentView.height)
        
        playlistNameLabel.frame = CGRect(x: Int(playlistCoverImageView.width) + 10, y: 0, width: Int(contentView.width - playlistCoverImageView.width - 10) , height: Int(contentView.height)/2)

        playlistDescriptionLabel.frame = CGRect(x: Int(playlistCoverImageView.width) + 10, y: Int(playlistNameLabel.height), width: Int(contentView.width - playlistCoverImageView.width - 10) , height: Int(contentView.height)/2)

    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
