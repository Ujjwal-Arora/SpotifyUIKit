////
////  CategoryViewController.swift
////  SpotifyUIKit
////
////  Created by Ujjwal Arora on 22/10/24.
////
//
//import UIKit
//
//class CategoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
//   
//    let categories : FeaturedPlaylistResponse
//    
//    private let  categoriesVCCollectionView : UICollectionView = {
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 200, height: 200)
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(CategoryDetailCollectionViewCell.self, forCellWithReuseIdentifier: CategoryDetailCollectionViewCell.identifier)
//        return collectionView
//    }()
//    
//    init(categories : FeaturedPlaylistResponse) {
//        self.categories = categories
//        super.init(nibName: nil, bundle: nil)
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(categoriesVCCollectionView)
//        view.backgroundColor = .red
//        categoriesVCCollectionView.frame = view.bounds
//        categoriesVCCollectionView.backgroundColor = .purple
//        
//        categoriesVCCollectionView.dataSource = self
//        categoriesVCCollectionView.delegate = self
//        
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        categories.playlists.items.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryDetailCollectionViewCell.identifier, for: indexPath)
//        cell.backgroundColor = .black
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        print("🍽️",categories.playlists.items)
//        let vc = CategoryViewController()
//   //     vc.playlist =
//    }
//    
//
//    
//
//}
