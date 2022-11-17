//
//  ForgotPasswordVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol ForgotPasswordPresenting {
    func forgotPasswordAction()
    func viewDidLoad()
}

final class ForgotPasswordVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: ForgotPasswordPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonForgotPassword: UIButton!
    
    private lazy var messageView: MessageView = DefaultMessageView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Methods
    // MARK: Private methods
    
    @IBAction private func forgotPasswordHandler(_ sender: Any) {
        presenter?.forgotPasswordAction()
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
    func update(with message: MessageType) {
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
