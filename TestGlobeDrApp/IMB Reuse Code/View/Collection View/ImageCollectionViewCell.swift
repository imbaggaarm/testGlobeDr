//
//  ImageCollectionViewCell.swift
//  Imbaggaarm
//
//  Created by Tai Duong on 5/7/17.
//  Copyright © 2017 Tai Duong. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: IMBBaseCollectionViewCell {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    var imageURLString: String? {
        didSet {
            loadImage()
        }
    }
    
    let imageView: UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = .black
        temp.contentMode = .scaleAspectFit
        temp.clipsToBounds = true
        return temp
    }()
    
    func loadImage() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.makeFullWithSuperView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

