//
//  LogInVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

final class LogInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        print(L10n.Global.hello)
    }
    
    func style() {
        view.backgroundColor = Asset.primaryBackground.color
    }
    
}
