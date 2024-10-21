import UIKit
import SDWebImage

class NewReleasesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewReleasesCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "swift")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let numberOfTracksLabel: UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 15, weight: .medium)
//        label.textColor = .secondaryLabel
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
  //      contentView.addSubview(numberOfTracksLabel)
        contentView.addSubview(artistNameLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints() {
        let albumCoverImageViewConstraints = [
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            albumCoverImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            albumCoverImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1, constant: -45)
        ]
        
        let albumNameLabelConstraints = [
            albumNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            albumNameLabel.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 5),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ]
        
        let artistNameLabelConstraints = [
            artistNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.leadingAnchor, constant: 0),
            artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 0),
            artistNameLabel.trailingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: -20)
        ]
        
//        let numberOfTracksLabelConstraints = [
//      //      numberOfTracksLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.le, constant: 10),
//            numberOfTracksLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 0),
//            numberOfTracksLabel.trailingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 0)
//        ]
        
        NSLayoutConstraint.activate(albumCoverImageViewConstraints)
        NSLayoutConstraint.activate(albumNameLabelConstraints)
        NSLayoutConstraint.activate(artistNameLabelConstraints)
      //  NSLayoutConstraint.activate(numberOfTracksLabelConstraints)
    }
    
    public func configure(viewModel: Album) {
        albumNameLabel.text = viewModel.name
  //      numberOfTracksLabel.text = "Tracks: \(viewModel.totalTracks)"
        artistNameLabel.text = viewModel.artists.first?.name
        
        guard let urlString = viewModel.images.first?.url else { return }
        albumCoverImageView.sd_setImage(with: URL(string: urlString))
    }
    
}

