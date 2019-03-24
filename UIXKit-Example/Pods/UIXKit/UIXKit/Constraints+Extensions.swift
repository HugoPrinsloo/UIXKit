//
//  Constraints+Extensions.swift
//  UIXKit
//
//  Created by Hugo Prinsloo on 2019/03/24.
//  Copyright © 2019 Hugo. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    class func constraints(for view: UIView, toFill containerView: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        let top = view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: insets.top)
        let bottom = view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -insets.bottom)
        let left = view.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: insets.left)
        let right = view.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -insets.right)
        return [top, bottom, left, right]
    }

    class func constraints(for view: UIView, toFill layoutGuide: UILayoutGuide, insets: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        let top = view.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top)
        let bottom = view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom)
        let left = view.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left)
        let right = view.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -insets.right)
        return [top, bottom, left, right]
    }
}

public extension UIView {
    
    /// Creates and activates constraints for the view to fill its superview
    /// with a given set of edge insets
    @objc func fillSuperview(insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = superview else {
            assert(false, "make sure to set superview")
            return
        }
        
        let constraints = NSLayoutConstraint.constraints(for: self, toFill: superview, insets: insets)
        NSLayoutConstraint.activate(constraints)
    }
    
    /// Creates and activates constraints for the view to fill its superview
    /// with a given set of edge insets
    @available(iOS 11.0, *)
    func fillSafeAreasInSuperview(insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = superview else {
            assert(false, "make sure to set superview")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = NSLayoutConstraint.constraints(for: self, toFill: superview.safeAreaLayoutGuide, insets: insets)
        NSLayoutConstraint.activate(constraints)
    }
    
    /// Creates and activates constraints for the view to center in its superview
    func centerToSuperview() {
        guard let superview = superview else {
            assert(false, "make sure to set superview")
            return
        }
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
    }
}
