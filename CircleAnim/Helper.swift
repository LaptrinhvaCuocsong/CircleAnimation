//
//  Helper.swift
//  CircleAnim
//
//  Created by Nguyen Manh Hung on 4/17/21.
//

import UIKit

let kScreen = UIScreen.main

let standarScreenSize = CGSize(width: 414, height: 896)

extension Int {
    var scaleH: CGFloat {
        return (CGFloat(self) / standarScreenSize.height) * kScreen.bounds.height
    }
    
    var scaleW: CGFloat {
        return (CGFloat(self) / standarScreenSize.width) * kScreen.bounds.width
    }
}

extension CACornerMask {
    static let all: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner]
}

extension UIApplication {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    }
}
