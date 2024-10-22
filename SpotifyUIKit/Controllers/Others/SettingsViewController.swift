//
//  SettingsViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var sections = [SettingsSection]()
    
    private let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        configureModels()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func configureModels(){
        sections.append(SettingsSection(title: "Profile", options: [Option(title: "View your profile", handler: { [weak self] in
            DispatchQueue.main.async {
                self?.viewProfile()
            }
        })]))
        
        sections.append(SettingsSection(title: "Account", options: [Option(title: "Sign Out", handler: { [weak self] in
                await self?.signOutTapped()
        })]))
    }
    private func viewProfile(){
        let vc = ProfileViewController()
        vc.title = "Profile"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    private func signOutTapped() async {
        let alert = UIAlertController(title: "Sign Out", message: "Are you sure", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut()
            DispatchQueue.main.async {
                let navVC = UINavigationController(rootViewController: WelcomeViewController())
                navVC.navigationBar.prefersLargeTitles = true
                navVC.modalPresentationStyle = .fullScreen
                self.present(navVC, animated: true)
            }
        }))
        
        present(alert, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let model = sections[indexPath.section].options[indexPath.row]
        cell.textLabel?.text = model.title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = sections[indexPath.section].options[indexPath.row]
        Task{
            await model.handler()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = sections[section]
        return model.title
    }
}
