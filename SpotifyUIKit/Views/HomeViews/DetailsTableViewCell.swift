//
//  DetailsTableViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 21/10/24.
//

import UIKit
import SDWebImage

class DetailsTableViewCell: UITableViewCell {
    
    static let identifier = "DetailsTableViewCell"
    

    let trackImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    let trackNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let artistNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    required init?(coder: NSCoder) {
        fatalError()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        contentView.addSubview(trackImageView)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        
        applyConstraints()

    }
    override func layoutSubviews() {
        
        trackImageView.backgroundColor = .clear
        trackNameLabel.backgroundColor = .clear
        artistNameLabel.backgroundColor = .clear

        
    }
    public func configureAudioTrack(audioTrack : Track){
        
        trackNameLabel.text = audioTrack.name
        let artistNames = audioTrack.artists.compactMap{$0.name}.joined(separator: ", ")
        artistNameLabel.text = artistNames
        
//        print("🔦",audioTrack.album?.images)
//        guard let urlString = audioTrack.album?.images.first?.url else { return }
//        trackImageView.sd_setImage(with: URL(string: urlString))

        trackImageView.isHidden = true
    }
    public func configurePlaylist(Playlist : Track){
        trackNameLabel.text = Playlist.name
        guard let urlString = Playlist.album?.images.first?.url else { return }
        trackImageView.sd_setImage(with: URL(string: urlString))

        
        let artistNames = Playlist.artists.map{$0.name}.joined(separator: ", ")
        artistNameLabel.text = artistNames
    }
    
    public func configureDetails(details : DetailsViewModel){
        trackNameLabel.text = details.title
        
        
        trackImageView.sd_setImage(with: URL(string: details.coverImageUrlString))
        
        artistNameLabel.text = details.artists
    }
    
    private func applyConstraints() {
        let trackImageViewConstraints = [
            trackImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            trackImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            trackImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10),
            trackImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10)
        ]
        
        let trackNameLabelConstraints = [
            trackNameLabel.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 10),
            trackNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        ]
        
        let artistNameLabelConstraints = [
            artistNameLabel.leadingAnchor.constraint(equalTo: trackImageView.trailingAnchor, constant: 10),
            artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 10),
            artistNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)

        ]
        
        NSLayoutConstraint.activate(trackImageViewConstraints)
        NSLayoutConstraint.activate(trackNameLabelConstraints)
        NSLayoutConstraint.activate(artistNameLabelConstraints)
    }
}
