//
//  Button.swift
//  StarterKit
//
//  Created by Alexandru Ghiura on 25/09/2018.
//  Copyright © 2018 Alexandru Ghiura. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    var activityIndicator:UIActivityIndicatorView!

    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }
    
    @IBInspectable
    var radius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    var loading: Bool = false {
        didSet {
            if loading {
                showLoading()
            } else {
                hideLoading()
            }
        }
    }

    public func showLoading() {
        if (activityIndicator == nil) {
            createActivityIndicator()
            centerActivityIndicatorInButton()
        }
        
        self.subviews[0].alpha = 0
        self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.5)
        self.isEnabled = false
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }
    
    public func hideLoading() {
        if activityIndicator != nil && activityIndicator.isAnimating {
            activityIndicator.stopAnimating()

            self.subviews[0].alpha = 1
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
            self.isEnabled = true
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = radius
    }
    
    func createActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        // activityIndicator.color = #colorLiteral(red: 0.8705882353, green: 0.1921568627, blue: 0.3019607843, alpha: 1)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        
        self.addSubview(activityIndicator)
    }
    
    func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)

        self.addConstraint(xCenterConstraint)
        self.addConstraint(yCenterConstraint)
    }

}
