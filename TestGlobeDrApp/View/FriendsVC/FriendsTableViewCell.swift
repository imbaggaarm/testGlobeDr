//
//  FriendsTableViewCell.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class FriendsTableViewCell: IMBBaseTableViewCell {
    
    var user: UserViewModel? {
        didSet {
            showData()
        }
    }
    let avatarImgView: UIImageView = {
        let temp = UIImageView()
        temp.layer.rasterizationScale = UIScreen.main.scale
        temp.layer.shouldRasterize = true
        temp.image = AppIcons.demoAvatarImage
        temp.backgroundColor = AppColors.white
        return temp
    }()
    
    let lblName: UILabel = {
        let temp = UILabel()
        temp.text = "Three-line item"
        temp.font = AppFonts.friendNameTableViewCellFont
        return temp
    }()
    
    let lblDescription: UILabel = {
        let temp = UILabel()
        temp.text = ""
        temp.numberOfLines = 2
        return temp
    }()
    
    let checkBox: UIButton = {
        let temp = UIButton()
        
        temp.setBackgroundImage(AppIcons.checkedIcon, for: .selected)
        temp.setBackgroundImage(AppIcons.unCheckedIcon, for: .normal)
        
        temp.backgroundColor = AppColors.white
        return temp
    }()
    
    override func setUpLayout() {
        super.setUpLayout()
        
        selectionStyle = .none
        
        contentView.addSubviews(subviews: avatarImgView, lblName, lblDescription, checkBox)
        
        contentView.addConstraintsWith(format: "H:|-10-[v0]-10-[v1]-10-[v2]-10-|", views: avatarImgView, lblName, checkBox)
        
        do {
            avatarImgView.translatesAutoresizingMaskIntoConstraints = false
            avatarImgView.topAnchor(equalTo: contentView.topAnchor, constant: 20)
            avatarImgView.makeCircle(corner: 30)
        }
        
        do {
            lblName.topAnchor(equalTo: avatarImgView.topAnchor)
        }
        
        do {
            lblDescription.translatesAutoresizingMaskIntoConstraints = false
            lblDescription.topAnchor(equalTo: lblName.bottomAnchor, constant: 5)
            lblDescription.leftAnchor(equalTo: lblName.leftAnchor)
            lblDescription.rightAnchor(equalTo: lblName.rightAnchor)
            lblDescription.bottomAnchor(equalTo: contentView.bottomAnchor, constant: -20)
        }
        
        do {
            checkBox.topAnchor(equalTo: lblName.topAnchor)
            checkBox.makeSquare(size: 20)
        }
    }
    
    //MARK: - ADD TARGET FOR CHECKBOX
    override func addTarget() {
        super.addTarget()
        checkBox.addTarget(self, action: #selector(didTapCheckbox), for: .touchUpInside)
    }
    
    @objc func didTapCheckbox() {
        defer {
            checkBox.isSelected = !checkBox.isSelected
        }
        user?.changeSelectedState(to: checkBox.isSelected)
    }
    
    //MARK: - SHOW DATA
    func showData() {
        if let user = user {
            avatarImgView.image = user.avatar
            lblDescription.text = user.userDescription
            lblName.text = user.name
            checkBox.isSelected = user.isSelected
        }
    }
}
