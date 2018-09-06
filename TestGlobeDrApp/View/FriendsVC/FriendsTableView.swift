//
//  FriendsCollectionView.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class FriendsTableView: UITableView {

    static let friendCellID = "friendCellID"
    
    convenience init() {
        let style = UITableViewStyle.plain
        self.init(frame: .zero, style: style)
        
        backgroundColor = AppColors.white
        alwaysBounceVertical = true
        separatorStyle = .none
        
        register(FriendsTableViewCell.self, forCellReuseIdentifier: FriendsTableView.friendCellID)
        
        estimatedRowHeight = 100
    }
}
