//
//  ViewController.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class FriendsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var friendsTableView: FriendsTableView = {
        let temp = FriendsTableView()
        temp.delegate = self
        temp.dataSource = self
        return temp
    }()
    
    override func setUpNavigationBar() {
        super.setUpNavigationBar()
        title = "Friends"
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: AppIcons.searchIcon, style: .done, target: self, action: #selector(didSelectSearchButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: AppIcons.menuIcon, style: .done, target: self, action: #selector(didSelectMenuButton))
    }
    
    @objc func didSelectMenuButton() {
        
    }
    
    @objc func didSelectSearchButton() {
        
    }
    
    override func setUpLayout() {
        super.setUpLayout()
        
        view.backgroundColor = AppColors.white
        
        view.addSubviews(subviews: friendsTableView)
        do {
            friendsTableView.makeFullWithSuperView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        navigationController?.navigationBar.barTintColor = AppColors.defaultNavigationBarColor
        navigationController?.navigationBar.isTranslucent = false
        
    }
}
//MARK: - TableView delegate + datasource
extension FriendsViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableView.friendCellID) as! FriendsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        showFriendDetailVC()
    }
    
    func showFriendDetailVC() {
        let friendDetailVC = FriendDetailViewController()
        show(friendDetailVC, sender: nil)
    }
}

