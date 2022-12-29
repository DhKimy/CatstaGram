//
//  UIView+Extension.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/29.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
