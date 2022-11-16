//
//  UINavigationController+Styles.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

extension UINavigationController {
    func styleBase() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            
            appearance.backgroundColor = Asset.navigationBarBackground.color
            appearance.titleTextAttributes = [.foregroundColor: Asset.primaryText.color]
            appearance.largeTitleTextAttributes = [.foregroundColor: Asset.primaryText.color]
            
            navigationBar.tintColor = Asset.primaryText.color
            navigationBar.standardAppearance = appearance
            navigationBar.compactAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}
