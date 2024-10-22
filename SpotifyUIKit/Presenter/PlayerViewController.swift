//
//  PlayerViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

class PlayerViewController: UIViewController {

    private let imageVeiw : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemBlue
        return imageView
    }()
    private let controlsView = PlayerControlsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(imageVeiw)
        view.addSubview(controlsView)
        configureBarButtons()
        
        self.controlsView.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageVeiw.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        controlsView.frame = CGRect(x: 10, y: imageVeiw.bottom + 10, width: view.width - 20, height: view.height - imageVeiw.height - view.safeAreaInsets.bottom - 20)
    }
    private func configureBarButtons(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapAction))

    }
    @objc private func didTapClose(){
        dismiss(animated: true)
    }
    @objc private func didTapAction(){
        
    }

}
extension PlayerViewController : PlayerControlsViewDelegate {
    func playerControlsViewDidTapPlayPauseButton(playerControlsView: PlayerControlsView) {
        
    }
    
    func playerControlsViewDidTapForwardButton(playerControlsView: PlayerControlsView) {
        
    }
    
    func playerControlsViewDidTapBackwardButton(playerControlsView: PlayerControlsView) {
        
    }
    
    
}
