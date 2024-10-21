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
        button.setTitle("SignIn with spotify", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Welcome"
        view.backgroundColor = .systemGreen
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
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
