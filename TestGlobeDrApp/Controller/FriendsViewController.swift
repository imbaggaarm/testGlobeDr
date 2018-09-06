//
//  ViewController.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

protocol FriendsViewControllerDelegate: class {
    func friendsViewControllerDidSelectUser(friendsVC: FriendsViewController, user: UserViewModel)
}

class FriendsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var users: [UserViewModel] = UserViewModel.demo
    
    var delegate: FriendsViewControllerDelegate!
    
    lazy var friendsTableView: FriendsTableView = {
        let temp = FriendsTableView()
        temp.delegate = self
        temp.dataSource = self
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let splitVC = splitViewController {
            splitVC.delegate = self
            if splitVC.viewControllers.count > 1 {
                if let detailNVC = splitVC.viewControllers[1] as? UINavigationController,
                    let detailVC = detailNVC.topViewController as? FriendDetailViewController {
                    delegate = detailVC
                }
            }
        }
    }
    
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
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableView.friendCellID) as! FriendsTableViewCell
        let row = indexPath.row
        cell.user = users[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let row = indexPath.row
        let user = users[row]
        delegate.friendsViewControllerDidSelectUser(friendsVC: self, user: user)
        if AppConstants.heightOfScreen > AppConstants.widthOfScreen {
            //in portrait mode, show friend detailVC, this is temp solution
            showFriendDetailVC(user: user)
        }
    }
    
    func showFriendDetailVC(user: UserViewModel) {
        let friendDetailVC = FriendDetailViewController()
        friendDetailVC.userViewModel = user
        show(friendDetailVC, sender: nil)
    }
}

extension FriendsViewController: UISplitViewControllerDelegate {
    //To show this viewcontroller in first time
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
