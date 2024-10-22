//
//  WelcomeViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let signInButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with spotify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let backgroundImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "backgroundImage")
        return imageView
    }()
    private let overlayView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.75
        return view
    }()
    private let logoImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let label : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.text = "Listen to Millions \n of songs on \n the go"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Spotify"
        view.backgroundColor = .black
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        view.addSubview(backgroundImageView)
        backgroundImageView.frame = view.bounds
        view.addSubview(overlayView)
        overlayView.frame = view.bounds

        view.addSubview(signInButton)
        
        view.addSubview(logoImageView)
        view.addSubview(label)


        logoImageView.frame = CGRect(x: view.width/2 - 60, y: view.height/2 - 150, width: 120, height: 120)
        label.frame = CGRect(x: 30, y: logoImageView.bottom + 30, width: view.width - 60, height: 150)
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20 , y: view.height - view.safeAreaInsets.bottom - 75, width: view.width - 40, height: 50)
    }
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
//    private func handleSignIn(success : Bool){
//        if success{
//            let mainTabBarVC = TabBarViewController()
//            mainTabBarVC.modalPresentationStyle = .fullScreen
//            present(mainTabBarVC, animated: true)
//        }else{
//            let alert = UIAlertController(title: "Error Sign In", message: "sorry", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
//            present(alert, animated: true)
//            
//        }
//    }
}
