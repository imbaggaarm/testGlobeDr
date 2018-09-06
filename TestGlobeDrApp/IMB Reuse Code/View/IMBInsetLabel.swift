//
//  IMBInsetLabel.swift
//  TestGlobeDrApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

open class IMBInsetLabel: UILabel {
    
    open var textInsets: UIEdgeInsets = .zero {
        didSet { setNeedsDisplay() }
    }
    
    open override func drawText(in rect: CGRect) {
        let insetRect = UIEdgeInsetsInsetRect(rect, textInsets)
        super.drawText(in: insetRect)
    }
    
}

