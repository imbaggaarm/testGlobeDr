//
//  FriendDetailViewController.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class FriendDetailViewController: BaseViewController, FriendsViewControllerDelegate {

    var userViewModel: UserViewModel? {
        didSet {
            showData()
        }
    }
    
    
    let imgVAvatar: UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = AppColors.white
        temp.contentMode = .scaleAspectFill
        temp.clipsToBounds = true
        return temp
    }()
    
    let lblDescription: UILabel = {
        let temp = UILabel()
        temp.backgroundColor = AppColors.white
        temp.numberOfLines = 0
        temp.font = AppFonts.friendDetailVCDescriptionFont
        return temp
    }()
    
    override func setUpNavigationBar() {
        super.setUpNavigationBar()

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: AppIcons.shareIcon, style: .done, target: self, action: #selector(didSelectShareButton))
    }
    
    @objc func didSelectShareButton() {
        
    }
    
    
    override func setUpLayout() {
        super.setUpLayout()
        
        view.addSubviews(subviews: imgVAvatar, lblDescription)
        
        view.addConstraintsWith(format: "V:|[v0]-5-[v1]", views: imgVAvatar, lblDescription)
        
        do {
            
            imgVAvatar.height(constant: AppConstants.heightOfScreen*1/3)
            imgVAvatar.makeFullWidthWithSuperView()
        }
        
        do {
            view.addConstraintsWith(format: "H:|-10-[v0]-10-|", views: lblDescription)
        }
    }
    
    func showData() {
        if let userViewModel = userViewModel {
            print(userViewModel)
            imgVAvatar.image = userViewModel.avatar
            title = userViewModel.name
            lblDescription.text = userViewModel.userDescription
        }
    }
}

//MARK: FriendsViewControllerDelegate
extension FriendDetailViewController {
    func friendsViewControllerDidSelectUser(friendsVC: FriendsViewController, user: UserViewModel) {
        userViewModel = user
    }
}
