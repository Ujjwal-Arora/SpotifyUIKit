//
//  ProfileViewController.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 17/10/24.
//

import SDWebImage
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var models = [String]()
    
    private let tableView : UITableView = {
       let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        
        Task{
            do{
                let profileModel = try await APICaller.shared.getCurrentUserProfile()
                DispatchQueue.main.async {
                    self.updateProfileUI(profileModel: profileModel)
                }
   
            } catch{
                failedToUpdateProfileUI()
                print(error.localizedDescription)
            }
        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    private func updateProfileUI(profileModel : UserProfileModel){
        tableView.isHidden = false
        
        models.append("Full Name : \(profileModel.displayName)")
        models.append("Email Address : \(profileModel.email)")
        models.append("User Id : \(profileModel.id)")
        models.append("Plan : \(profileModel.product)")
        
        createTableHeader(profileImageUrl: profileModel.images.first?.url)
        
        tableView.reloadData()
    }
    private func createTableHeader(profileImageUrl : String?){
        guard let urlString = profileImageUrl, let url = URL(string: urlString) else {return}
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/2))
        
        let imageSize : CGFloat = headerView.height
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        
        tableView.tableHeaderView = headerView
    }
    private func failedToUpdateProfileUI(){
        let label = UILabel(frame: .zero)
        label.text = "Failed to load user profile"
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    

}
//AQDpj2LTGzuBCgSqYvLnaDE1gpEOEhh8etGVv6oxK5pCC9fiu5Zt3bfx87sLv_Puc71VTpN1sgZL2N9VwfPr2QPMExMvEPPhJ_C05-gb95y2uK0f_LjqXs_74mLEr39-7pM

//new refreshtoken
//AQA69EEzv3dNtyxoTFMeE-yC8kL3XE0y9BGE8VXDpDqkcvCt9IWViGcoEJToPMzvbJS9N1IeIbr8QK-CGf4gfoyzMrc-Oe_tAwDNrwfc4gNcjmP4KSNoAzMy0BtEJb_BIJk
