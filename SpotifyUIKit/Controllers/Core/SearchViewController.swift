//
//  SearchViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

extension SearchViewController : SearchResultViewControllerDelegate{
    func didTapRow(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
}

class SearchViewController: UIViewController, UISearchResultsUpdating, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    
    private var categories = [Category]()
    
    private let searchController : UISearchController = {
        let vc = UISearchController(searchResultsController: SearchResultViewController())
        vc.searchBar.placeholder = "Search songs, artists, albums"
        vc.searchBar.searchBarStyle = .minimal
        vc.definesPresentationContext = true //??
        return vc
    }()
    private let searchVCCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 180, height: 135)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemPink
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVCCollectionView.dataSource = self
        searchVCCollectionView.delegate = self
        view.backgroundColor = .systemBackground
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        view.addSubview(searchVCCollectionView)
        
        Task{
            self.categories = try await APICaller.shared.getCategories().categories.items
            DispatchQueue.main.async {
                self.searchVCCollectionView.reloadData()
            }
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchVCCollectionView.frame = view.bounds
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsController = searchController.searchResultsController as? SearchResultViewController, let query = searchController.searchBar.text, !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
       print(query)
        
        resultsController.delegate = self
        
        Task{
            let searchResults = try await APICaller.shared.searchResults(query: query)
            resultsController.update(searchResults: searchResults)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(category: categories[indexPath.row])
        return cell
                
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        collectionView.deselectItem(at: indexPath, animated: true)
//        
//        let selectedCategory = categories[indexPath.row]
//        
//        Task{
//            let details = try await APICaller.shared.getCategoryPlaylist(playlistId: selectedCategory.id)
//            
//            DispatchQueue.main.async {
//                let vc = CategoryViewController(categories: details)
//                vc.title = selectedCategory.name
//                vc.view.backgroundColor = .blue
//                self.navigationController?.pushViewController(vc, animated: true)
//
//            }
//            
//        }
//        
//        
//    }
    
}
