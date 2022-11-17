//
//  ForgotPasswordCoordinator.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

final class ForgotPasswordCoordinator: Coordinating {

    unowned var sl: ServiceLocator
    
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?, sl: ServiceLocator) {
        self.navigationController = navigationController
        self.sl = sl
    }

    func start() {
        let vc = StoryboardScene.ForgotPasswordIB.initialScene.instantiate()
        
        let interactor = ForgotPasswordInteractor(sl: sl)
        
        let presenter = ForgotPasswordPresenter(view: vc,
                                                coordinator: self,
                                                interactor: interactor)
        
        vc.presenter = presenter
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
