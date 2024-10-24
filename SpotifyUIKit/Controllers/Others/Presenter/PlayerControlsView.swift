//
//  PlayerControlsView.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 22/10/24.
//

import Foundation
import UIKit

protocol PlayerControlsViewDelegate : AnyObject{
    func playerControlsViewDidTapPlayPauseButton(playerControlsView : PlayerControlsView)
    func playerControlsViewDidTapForwardButton(playerControlsView : PlayerControlsView)
    func playerControlsViewDidTapBackwardButton(playerControlsView : PlayerControlsView)

}

final class PlayerControlsView : UIView {
    
    weak var delegate : PlayerControlsViewDelegate?
    
    private let volumeSlider : UISlider = {
       let slider = UISlider()
        slider.value = 0.5
        return slider
    }()
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.text = "This is the songs"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    private let subtitleLabel : UILabel = {
       let label = UILabel()
        label.text = "Drake , J.Cole"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = .secondaryLabel
        return label
    }()
    private let backBUtton : UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    private let forwardBUtton : UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    private let playPauseBUtton : UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(volumeSlider)
        addSubview(backBUtton)
        addSubview(forwardBUtton)
        addSubview(playPauseBUtton)
        
        clipsToBounds = true

        backBUtton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        forwardBUtton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        playPauseBUtton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)

    }
    @objc private func didTapBack(){
        delegate?.playerControlsViewDidTapBackwardButton(playerControlsView: self)
    }
    @objc private func didTapNext(){
        delegate?.playerControlsViewDidTapForwardButton(playerControlsView: self)

    }
    @objc private func didTapPlayPause(){
        delegate?.playerControlsViewDidTapPlayPauseButton(playerControlsView: self)

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        subtitleLabel.frame = CGRect(x: 0, y: nameLabel.bottom + 10, width: width, height: 50)

        volumeSlider.frame = CGRect(x: 10, y: subtitleLabel.bottom + 10, width: width - 20, height: 45)
        
        let buttonSize : CGFloat = 60
        playPauseBUtton.frame = CGRect(x: (width-buttonSize)/2, y: volumeSlider.bottom + 30, width: buttonSize, height: buttonSize)
        backBUtton.frame = CGRect(x: playPauseBUtton.left - 80 - buttonSize, y: playPauseBUtton.top, width: buttonSize, height: buttonSize)
        forwardBUtton.frame = CGRect(x: playPauseBUtton.right + 80, y: playPauseBUtton.top, width: buttonSize, height: buttonSize)

    }
    func configure(viewModel : PLayerControlsViewViewModel){
        nameLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }
}
