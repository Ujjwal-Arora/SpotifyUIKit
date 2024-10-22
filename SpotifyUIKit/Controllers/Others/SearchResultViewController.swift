//
//  SearchResultViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

struct SearchResultSection{
    let title : String
    let results : [SearchResultViewModel]
}

protocol SearchResultViewControllerDelegate : AnyObject {
    func didTapRow(controller : UIViewController)
    
}

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate : SearchResultViewControllerDelegate?
   
    var sections = [SearchResultSection]()
    
    private let tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func update(searchResults : [SearchResultViewModel]){
        
        let tracks = searchResults.filter({
            switch $0 {
            case .track:
                return true
            default:
                return false
            }
        })
        let albums = searchResults.filter({
            switch $0 {
            case .album:
                return true
            default:
                return false
            }
        })
        self.sections = [
            SearchResultSection(
                title: "Songs",
                results: tracks
            ),
            SearchResultSection(
                title: "Albums",
                results: albums
            )
        ]
        
        tableView.reloadData()
        tableView.isHidden = searchResults.isEmpty
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = sections[indexPath.section].results[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .clear
        
        switch result {
        case .album(let model) :
            cell.textLabel?.text = model.name
            
        case .track(let model) :
            cell.textLabel?.text = model.name
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  sections[section].title
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let result = sections[indexPath.section].results[indexPath.row]
        
        switch result {
        case .track(let model):
            PlaybackPresenter.shared.startPlayback(viewcontroller: self, track: model)
        case .album(let model):
            let vc = DetailsViewController()
            Task{
                let albumResponse = try await APICaller.shared.getAlbum(albumId: model.id)
                
                vc.album = albumResponse
                vc.view.backgroundColor = .systemBackground
                navigationController?.pushViewController(vc, animated: true)
                
                delegate?.didTapRow(controller: vc)
            }
        }
    }
}
