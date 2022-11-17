//
//  LogInCoordinator.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

final class LogInCoordinator: Coordinating {

    unowned var sl: ServiceLocator
    
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?, sl: ServiceLocator) {
        self.navigationController = navigationController
        self.sl = sl
    }

    func start() {
        let vc = StoryboardScene.LogInIB.initialScene.instantiate()
        
        let interactor = LogInInteractor(sl: sl)
        
        let presenter = LogInPresenter(view: vc,
                                       coordinator: self,
                                       interactor: interactor)
        
        vc.presenter = presenter
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
