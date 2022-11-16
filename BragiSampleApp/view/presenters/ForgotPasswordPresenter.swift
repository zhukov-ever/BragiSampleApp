//
//  ForgotPasswordPresenter.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol ForgotPasswordView: UIViewController {
    
}

final class ForgotPasswordPresenter {
    
    private weak var view: ForgotPasswordView?
    private var coordinator: Coordinating

    internal init(view: ForgotPasswordView?,
                  coordinator: Coordinating) {
        self.view = view
        self.coordinator = coordinator
    }

}

extension ForgotPasswordPresenter: SignUpPresenting {
    func signUpAction() {
        
    }
}
