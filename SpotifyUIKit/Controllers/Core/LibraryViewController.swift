//
//  LibraryViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import UIKit

class LibraryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
}
////
////  RecommendedTrackTableViewCell.swift
////  SpotifyUIKit
////
////  Created by Ujjwal Arora on 20/10/24.
////
//
//import UIKit
//
//class RecommendedTrackTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    private var albums = [Album]()
//
//    static let identifier = "RecommendedTrackTableViewCell"
//    RecommendedTrackTableViewCell
//    RecommendedTrackTableViewCell
//    private let RecommendedTrackCollectionView : UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.minimumLineSpacing = 10
//        layout.sectionInset = .zero
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collectionView.register(RecommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier)
//        return collectionView
//    }()
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(RecommendedTrackCollectionView)
//        RecommendedTrackCollectionView.delegate = self //why these
//        RecommendedTrackCollectionView.dataSource = self //why these
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        RecommendedTrackCollectionView.frame = contentView.bounds
//    }
////    public func configure(viewModel : [Album]){
////        self.albums = viewModel
//////        DispatchQueue.main.async {
//////                self.RecommendedTrackCollectionView.reloadData()
//////            }
////        self.RecommendedTrackCollectionView.reloadData()
////
////    }
//    
//    @MainActor
//    public func configure(viewModel: [Album]) {
//        self.albums = viewModel
//        self.RecommendedTrackCollectionView.reloadData()
//    }
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("🦄",albums.count)
//        return albums.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTrackTableViewCell.identifier, for: indexPath) as? RecommendedTrackCollectionViewCell else { return UICollectionViewCell() }
//        
//        cell.configure(viewModel: albums[indexPath.row])
//        return cell
//        
//    }
//    
//}
////
////  RecommendedTrackTableViewCell.swift
////  SpotifyUIKit
////
////  Created by Ujjwal Arora on 20/10/24.
////
//
//import UIKit
//
//class RecommendedTrackTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    private var albums = [Album]()
//    
//    static let identifier = "RecommendedTrackTableViewCell"
//    
//    private let recommendedTrackCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 100)
//        layout.minimumLineSpacing = 10
//        layout.sectionInset = .zero
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(RecommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: RecommendedTrackCollectionViewCell.identifier)
//        return collectionView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(recommendedTrackCollectionView)
//        recommendedTrackCollectionView.delegate = self
//        recommendedTrackCollectionView.dataSource = self
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        recommendedTrackCollectionView.frame = contentView.bounds
//    }
//    
//    @MainActor
//    public func configure(viewModel: [Album]) {
//        self.albums = viewModel
//        self.recommendedTrackCollectionView.reloadData() // Reload collection view with new data
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return albums.count // Return the count of albums
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedTrackCollectionViewCell.identifier, for: indexPath) as? RecommendedTrackCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        
//        cell.configure(viewModel: albums[indexPath.item]) // Pass the album to the cell
//        return cell
//    }
//}




//
//  ViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//



//
//import UIKit
//
//class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var newReleases = [Album]()
//
//
//    private var homeViewTable : UITableView = {
//        var table = UITableView(frame: .zero, style: .grouped)
//        table.backgroundColor = .systemPink
//
//        table.register(RecommendedTrackTableViewCell.self, forCellReuseIdentifier: RecommendedTrackTableViewCell.identifier)
//        return table
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.fetchData()
//
//        DispatchQueue.main.async {
//            self.homeViewTable.reloadData()
//        }
//
//        view.backgroundColor = .systemBackground
//
//        view.addSubview(homeViewTable)
//        homeViewTable.delegate = self
//        homeViewTable.dataSource = self
//    }
//    override func viewDidLayoutSubviews() {
//        homeViewTable.frame = view.bounds
//    }
//
//    @objc func didTapSettings(){
//        let vc = SettingsViewController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("🐻‍❄️",newReleases.count)
//
//        return 1 //change this
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0 :
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTrackTableViewCell.identifier, for: indexPath) as? RecommendedTrackTableViewCell else { return UITableViewCell() }
//            cell.backgroundColor = .purple
//
//            cell.configure(viewModel: newReleases)
//            return cell
//        default:
//            return UITableViewCell()
//        }
//
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        200
//    }
//    func fetchData(){
//        Task{
//            async let newReleasesResponse =  APICaller.shared.getNewReleases()
//
//            self.newReleases = try await  newReleasesResponse.albums.items
//            DispatchQueue.main.async {
//                            self.homeViewTable.reloadData()
//            }
//
//        }
//    }
//}

