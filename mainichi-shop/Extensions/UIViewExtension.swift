//
//  UIViewExtension.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/1/23.
//

import Foundation
import UIKit

extension UIView {
    public func applyCorner (cornerRadius: Double, borderWidth: Double, borderColor: UIColor){
       
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
