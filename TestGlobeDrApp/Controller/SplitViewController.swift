//
//  SplitViewController.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//
import UIKit

class DefaultSplitViewController: BaseSplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        
        view.backgroundColor = AppColors.themeColor
    }
}
