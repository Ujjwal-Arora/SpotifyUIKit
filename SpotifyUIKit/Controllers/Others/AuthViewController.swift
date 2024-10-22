//
//  AuthViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import WebKit
import UIKit
class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let pref = WKWebpagePreferences()
        pref.allowsContentJavaScript = true
        
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = pref
        
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignIn"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        guard let url = AuthManager.shared.signInUrl else { return }
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        guard let url = navigationAction.request.url else {
            return .allow
        }
        
        let urlComponents = URLComponents(string: url.absoluteString)
        
        if let code = urlComponents?.queryItems?.first(where: { $0.name == "code" })?.value {
            webView.isHidden = true
            
            // Exchange the code for an access token using async/await
            do {
                try await AuthManager.shared.exchangeCodeForToken(code: code)
                print("Token exchange successful")
                
                // Navigate to the main tab bar controller
                DispatchQueue.main.async {
                    let mainTabBarVC = TabBarViewController()
                    mainTabBarVC.modalPresentationStyle = .fullScreen
                    self.present(mainTabBarVC, animated: true)
                }
            } catch {
                print("Error exchanging token: \(error.localizedDescription)")
            }
            
            return .cancel // Cancel the navigation since we have the code
        }
        
        return .allow // Allow navigation for other URLs
    }
}
