//
//  User.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class User {
    var name: String?
    var userDescription: String?
    var avatar: UIImage?
    var isSelected: Bool = false
    
    convenience init?(dict: [String: Any]) {
        self.init()
        
        if let name = dict["name"] as? String,
            let userDescription = dict["description"] as? String {
            self.name = name
            self.userDescription = userDescription
        }
        
    }
    
    convenience init(name: String, userDescription: String) {
        self.init()
        isSelected = Int(arc4random() % 2) == 1
        self.name = name
        self.userDescription = userDescription
    }
}
