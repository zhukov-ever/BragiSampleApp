//
//  UIImage+Ext.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

extension UIColor {
    func image() -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()

        context?.setFillColor(cgColor)
        context?.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
