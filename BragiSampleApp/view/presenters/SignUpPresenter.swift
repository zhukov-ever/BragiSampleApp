//
//  SignUpPresenter.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol SignUpView: UIViewController {
    
}

final class SignUpPresenter {
    
    private weak var view: SignUpView?
    private var coordinator: Coordinating

    internal init(view: SignUpView?,
                  coordinator: Coordinating) {
        self.view = view
        self.coordinator = coordinator
    }

}

extension SignUpPresenter: SignUpPresenting {
    func signUpAction() {
        let coordinator = ForgotPasswordCoordinator(navigationController: view?.navigationController)
        coordinator.start()
    }
}
