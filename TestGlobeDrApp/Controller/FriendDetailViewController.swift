//
//  FriendDetailViewController.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class FriendDetailViewController: BaseViewController {
    
    let imgVAvatar: UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = AppColors.themeColor
        temp.contentMode = .scaleAspectFill
        temp.image = AppIcons.demoAvatarImage
        return temp
    }()
    
    let lblDescription: UILabel = {
        let temp = UILabel()
        temp.backgroundColor = AppColors.white
        temp.numberOfLines = 0
        temp.font = AppFonts.friendDetailVCDescriptionFont
        temp.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
        return temp
    }()
    
    override func setUpNavigationBar() {
        super.setUpNavigationBar()
        title = "John Doe"

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
}
