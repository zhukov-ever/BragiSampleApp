//
//  SignUpCoordinator.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

final class SignUpCoordinator: Coordinating {

    unowned var sl: ServiceLocator
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?, sl: ServiceLocator) {
        self.navigationController = navigationController
        self.sl = sl
    }

    func start() {
        let vc = StoryboardScene.SignUpIB.initialScene.instantiate()
        
        let interactor = SignUpInteractor(sl: sl)
        
        let presenter = SignUpPresenter(view: vc,
                                        coordinator: self,
                                        interactor: interactor)
        
        vc.presenter = presenter
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
