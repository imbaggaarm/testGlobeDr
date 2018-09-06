//
//  UserViewModel.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

class UserViewModel {
    
    var avatar: UIImage?
    
    var name: String? {
        return user.name
    }
    
    var userDescription: String? {
        return user.userDescription
    }
    
    var isSelected: Bool {
        return user.isSelected
    }
    
    var user: User!
    
    init(user: User) {
        self.user = user
        avatar = AppIcons.demoAvatarImage
    }
    
    func changeSelectedState(to isSelected: Bool) {
        user.isSelected = isSelected
    }
    
    static let demo = [
        UserViewModel.init(user: User.init(name: "Tai Duong", userDescription: " has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishi")),
        UserViewModel.init(user: User.init(name: "Tai Duong 1", userDescription: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it")),
        UserViewModel.init(user: User.init(name: "Tai Duong 2", userDescription: "ng packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in the")),
        UserViewModel.init(user: User.init(name: "Tai Duong 3", userDescription: "ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
        UserViewModel.init(user: User.init(name: "Tai Duong 4", userDescription: "ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),
        UserViewModel.init(user: User.init(name: "Tai Duong 5", userDescription: "ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). ir infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")),

    ]
    
    
}
