//
//  LogInPresenter.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol LogInView: UIViewController {
    
}

final class LogInPresenter {
    
    private weak var view: LogInView?
    private var coordinator: Coordinating

    internal init(view: LogInView?,
                  coordinator: Coordinating) {
        self.view = view
        self.coordinator = coordinator
    }

}

extension LogInPresenter: LogInPresenting {
    func logInAction() {
        let coordinator = SignUpCoordinator(navigationController: view?.navigationController)
        coordinator.start()
    }
}
