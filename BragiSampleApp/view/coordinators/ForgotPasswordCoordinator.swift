//
//  ForgotPasswordCoordinator.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

final class ForgotPasswordCoordinator: Coordinating {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = StoryboardScene.ForgotPasswordIB.initialScene.instantiate()
        let presenter = ForgotPasswordPresenter(view: vc,
                                                coordinator: self)
        
        vc.presenter = presenter
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
