//
//  View+AutoLayout.swift
//  TestRestfulApiApp
//
//  Created by Imbaggaarm on 9/6/18.
//  Copyright © 2018 Tai Duong. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWith(format: String, views: UIView...)
    {
        var dic = Dictionary<String, UIView>()
        for (index, view) in views.enumerated()
        {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            dic[key] = view
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
    
    func addConstraintsWith(format: String, views: [UIView])
    {
        var dic = Dictionary<String, UIView>()
        for (index, view) in views.enumerated()
        {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            dic[key] = view
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: dic))
    }
    
    func addSameContraintsWith(format: String, forColOfViewGroup viewCol: [UIView]...)
    {
        for i in viewCol
        {
            addConstraintsWith(format: format, views: i)
        }
    }
    
    func addBlurEffect(with effect: UIBlurEffectStyle, bounds: CGRect = .zero)
    {
        let blurEffect = UIBlurEffect.init(style: effect)
        let effectV = UIVisualEffectView.init(effect: blurEffect)
        self.addSubview(effectV)
        self.sendSubview(toBack: effectV)
        self.backgroundColor = .clear
        if bounds == .zero {
            effectV.frame = self.bounds
        } else {
            effectV.frame = bounds
        }
        effectV.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func addSubviews(subviews: UIView...)
    {
        for subview in subviews {
            addSubview(subview)
        }
    }
    
    func addSameConstraintsWith(format: String, for views: UIView...)
    {
        for view in views
        {
            addConstraintsWith(format: format, views: view)
        }
    }
    
    func addShadow(color: UIColor, radius: CGFloat, shadowOffSet: CGSize = .zero)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = shadowOffSet
        layer.shadowRadius = radius
        layer.shouldRasterize = false
        //layer.shadowPath = UIBezierPath(rect: yourView.bounds).cgPath
    }
    
    func addRightLayer(color: UIColor = .black, width: CGFloat = 1)
    {
        let rightLine = UIView()
        self.addSubview(rightLine)
        rightLine.backgroundColor = color
        self.addConstraintsWith(format: "V:|[v0]|", views: rightLine)
        self.addConstraintsWith(format: "H:[v0(\(width))]|", views: rightLine)
    }
    
    //MARK: addConstraints
    func makeSquare(size: CGFloat = 0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        if size != 0
        {
            self.heightAnchor.constraint(equalToConstant: size).isActive = true
        }
    }
    func makeRectangle(heightPerWidth: CGFloat, size: CGFloat = 0)
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: heightPerWidth).isActive = true
        
        if size != 0
        {
            self.heightAnchor.constraint(equalToConstant: size).isActive = true
        }
    }
    
    func makeRectangle(width: CGFloat, height: CGFloat)
    {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func makeCircle(corner: CGFloat)
    {
        if corner != 0
        {
            makeSquare(size: corner*2)
        }
        else
        {
            makeSquare()
        }
        self.layer.masksToBounds = true
        self.layer.cornerRadius = corner
    }
    
    func makeCenter(with view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    func makeFull(with view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWith(format: "V:|[v0]|", views: self)
        view.addConstraintsWith(format: "H:|[v0]|", views: self)
    }
    
    func makeRatio(ratio: CGFloat, with view: UIView, isSquare: Bool = false)
    {
        translatesAutoresizingMaskIntoConstraints = false
        if isSquare
        {
            makeSquare()
            widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio).isActive = true
            return
        }
        
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio).isActive = true
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: ratio).isActive = true
    }
    
    
    func makeEqual(with view: UIView)
    {
        makeRatio(ratio: 1, with: view)
    }
    
    func makeFullWidth(with view: UIView)
    {
        translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWith(format: "H:|[v0]|", views: self)
    }
    
    func makeFullHeight(with view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addConstraintsWith(format: "V:|[v0]|", views: self)
    }
    
    func makeFullWithSuperView() {
        makeFull(with: self.superview!)
    }
    
    func makeFullWidthWithSuperView() {
        makeFullWidth(with: self.superview!)
    }
    func makeFullHeightWithSuperView(){
        makeFullHeight(with: self.superview!)
    }
    
    func height(constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func width(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func centerXAnchor(with view: UIView, constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
    
    func centerYAnchor(with view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    func bottomAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func topAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0) {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func leftAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
        leftAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func rightAnchor(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
        rightAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
    
    func widthAnchor(equalTo dimension: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        widthAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func heightAnchor(equalTo dimension: NSLayoutDimension, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        heightAnchor.constraint(equalTo: dimension, multiplier: multiplier, constant: constant).isActive = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, bounds: CGRect) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    

}
