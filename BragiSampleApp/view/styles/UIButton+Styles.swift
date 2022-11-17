//
//  UIButton+Styles.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

extension UIButton {
    func stylePrimaryAction(with title: String) {
        setTitle(title, for: .normal)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            
            configuration.baseBackgroundColor = Asset.accentBackground.color
            configuration.baseForegroundColor = Asset.onDarkBackgroundText.color
            
            self.configuration = configuration
        } else {
            setBackgroundImage(Asset.accentBackground.color.image(), for: .normal)
            setBackgroundImage(Asset.accentBackground.color.withAlphaComponent(0.8).image(), for: .highlighted)
            setTitleColor(Asset.onDarkBackgroundText.color, for: .normal)
        }
    }
}
