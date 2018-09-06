//
//  UIFont.swift
//  TestRestfulApiApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func appFont(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    static func helveticaNeue(size: CGFloat, type: HelveType) -> UIFont {
        return UIFont.init(name: type.rawValue, size: size)!
    }
    
    
    enum HelveType: String {
        case bold = "HelveticaNeue-Bold"
        case light = "HelveticaNeue-Light"
        case italic = "HelveticaNeue-Italic"
        case medium = "HelveticaNeue-Medium"
        case ultraLight = "HelveticaNeue-UltraLight"
        case condensedBlack = "HelveticaNeue-CondensedBlack"
        case boldItalic = "HelveticaNeue-BoldItalic"
        case thin = "HelveticaNeue-Thin"
        case thinItalic = "HelveticaNeue-ThinItalic"
        case lightItalic = "HelveticaNeue-LightItalic"
        case ultraLightItalic = "HelveticaNeue-UltraLightItalic"
        case mediumItalic = "HelveticaNeue-MediumItalic"
        case normal = "HelveticaNeue"
    }
    
    class func avenirNext(size: CGFloat, type: AvenirNextType) -> UIFont {
        return UIFont.init(name: type.rawValue, size: size)!
    }
    
    enum AvenirNextType: String {
        case mediumItalic = "AvenirNext-MediumItalic"
        case bold = "AvenirNext-Bold"
        case ultraLight = "AvenirNext-UltraLight"
        case demiBold = "AvenirNext-DemiBold"
        case heavyItalic = "AvenirNext-HeavyItalic"
        case heavy = "AvenirNext-Heavy"
        case medium = "AvenirNext-Medium"
        case italic = "AvenirNext-Italic"
        case ultraLightItalic = "AvenirNext-UltraLightItalic"
        case boldItalic = "AvenirNext-BoldItalic"
        case regular = "AvenirNext-Regular"
        case demiBoldItalic = "AvenirNext-DemiBoldItalic"
    }
    
    static func avenir(size: CGFloat, type: AvenirType) -> UIFont {
        return UIFont.init(name: type.rawValue, size: size)!
    }
    
    enum AvenirType: String {
        case heavy = "Avenir-Heavy"
        case oblique = "Avenir-Oblique"
        case black = "Avenir-Black"
        case book = "Avenir-Book"
        case blackOblique = "Avenir-BlackOblique"
        case heavyOblique = "Avenir-HeavyOblique"
        case light = "Avenir-Light"
        case mediumOblique = "Avenir-MediumOblique"
        case medium = "Avenir-Medium"
        case lightOblique = "Avenir-LightOblique"
        case roman = "Avenir-Roman"
        case bookOblique = "Avenir-BookOblique"
    }
}
