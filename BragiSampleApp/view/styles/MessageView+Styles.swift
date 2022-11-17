//
//  MessageView+Styles.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import UIKit

extension MessageView {
    
    func styleError() {
        label.textColor = Asset.onDarkBackgroundText.color
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        backgroundColor = Asset.backgroundMessageRed.color
        backgroundColor = .red.withAlphaComponent(0.8)
    }
    
    func styleWarning() {
        label.textColor = Asset.onLightBackgroundText.color
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        backgroundColor = Asset.backgroundMessageYellow.color
        backgroundColor = .yellow.withAlphaComponent(0.8)
    }
    
    func styleInfo() {
        label.textColor = Asset.onDarkBackgroundText.color
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        backgroundColor = Asset.backgroundMessageBlue.color
        backgroundColor = .blue.withAlphaComponent(0.8)
    }
    
    func styleSuccess() {
        label.textColor = Asset.onLightBackgroundText.color
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        backgroundColor = Asset.backgroundMessageGreen.color
        backgroundColor = .green.withAlphaComponent(0.8)
    }
}
