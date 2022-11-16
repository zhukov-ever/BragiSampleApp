//
//  SignUpVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol SignUpPresenting {
    func signUpAction()
}

final class SignUpVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SignUpPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonSignUp: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Methods
    // MARK: Private methods
    
    @IBAction private func signUpHandler(_ sender: Any) {
        presenter?.signUpAction()
    }
    
    private func configure() {
        title = L10n.View.SignUp.title
        
        buttonSignUp.stylePrimaryAction(with: L10n.View.SignUp.Button.signUp)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.stylePrimaryBackground()
        navigationController?.styleBase()
    }
    
}

extension SignUpVC: SignUpView {
    
}

