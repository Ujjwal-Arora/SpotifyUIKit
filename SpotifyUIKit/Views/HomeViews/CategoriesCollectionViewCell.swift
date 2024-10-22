//
//  CategoriesCollectionViewCell.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 21/10/24.
//

import UIKit
import SDWebImage

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriesCollectionViewCell"
        
    private let genreImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        imageView.image = UIImage(systemName: "swift")
        return imageView
    }()
    private let genreNameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    private let colors : [UIColor] = [.systemPink,.systemOrange,.systemPurple,.systemTeal,.systemGreen,.purple,.blue,.orange,.systemMint,.systemIndigo,]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = colors.randomElement()
        contentView.addSubview(genreImageView)
        contentView.addSubview(genreNameLabel)
        contentView.layer.cornerRadius = 10
        
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        genreNameLabel.frame = CGRect(x: 10, y: contentView.height/2, width: contentView.width - 20, height: contentView.height/2)
        genreImageView.frame = CGRect(x: contentView.width/2, y: 0, width: contentView.width/2, height: contentView.height/2)
    }
    public func configure(category : Category ){
        genreNameLabel.text = category.name
        
        guard let urlString =  category.icons.first?.url else {return}
        genreImageView.sd_setImage(with: URL(string: urlString))
        
    }
}
