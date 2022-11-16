//
//  ForgotPasswordVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol ForgotPasswordPresenting {
    
}

final class ForgotPasswordVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SignUpPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonForgotPassword: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Methods
    // MARK: Private methods
    
    @IBAction private func forgotPasswordHandler(_ sender: Any) {
        presenter?.signUpAction()
    }
    
    private func configure() {
        title = L10n.View.ForgotPassword.title
        
        buttonForgotPassword.stylePrimaryAction(with: L10n.View.ForgotPassword.Button.forgotPassword)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.stylePrimaryBackground()
        navigationController?.styleBase()
    }
}

extension ForgotPasswordVC: ForgotPasswordView {
    
}
