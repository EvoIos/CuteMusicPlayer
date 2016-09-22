//
//  UIImage+Extension.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/17.
//  Copyright © 2016年 LC. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resizeToSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
