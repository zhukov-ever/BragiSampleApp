//
//  SignUpVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol SignUpPresenting {
    func signUpAction()
    func viewWillAppear()
    func viewDidDisappear()
}

final class SignUpVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: SignUpPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonSignUp: UIButton!
    
    private lazy var messageView: MessageView = DefaultMessageView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        presenter?.viewWillAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.viewDidDisappear()
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
    func show(message: MessageType) {
        Log.debug(in: self, message: message)
        
        switch message {
        case let .connectionError(message):
            messageView.styleError()
            messageView.show(in: view, text: message)
        case let .connected(message):
            messageView.styleSuccess()
            messageView.show(in: view, text: message)
        case let .connecting(message):
            messageView.styleWarning()
            messageView.show(in: view, text: message)
        case let .messageSent(message):
            messageView.styleInfo()
            messageView.show(in: view, text: message)
        }
    }
}
