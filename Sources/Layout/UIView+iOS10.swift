//
//  UIView+iOS10.swift
//  Layoutless
//
//  Created by Srdan Rasic on 02/05/2018.
//  Copyright © 2018 Declarative Hub. All rights reserved.
//

import UIKit

extension UIView {

    private struct AssociatedKeys {
        static var safeAreaLayoutGuide = "safeAreaLayoutGuide"
    }

    internal var ___safeAreaLayoutGuide: UILayoutGuide {
        get {
            let layoutGuide = objc_getAssociatedObject(self, &AssociatedKeys.safeAreaLayoutGuide) as? UILayoutGuide
            if let layoutGuide = layoutGuide {
                return layoutGuide
            } else {
                let layoutGuide = UILayoutGuide()
                addLayoutGuide(layoutGuide)
                NSLayoutConstraint.activate([
                    layoutGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
                    layoutGuide.trailingAnchor.constraint(equalTo: trailingAnchor)
                ])
                objc_setAssociatedObject(self, &AssociatedKeys.safeAreaLayoutGuide, layoutGuide, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return layoutGuide
            }
        }
    }
}
