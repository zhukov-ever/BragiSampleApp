//
//  LogInVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol LogInPresenting {
    func logInAction()
    func sendCommand()
    func viewWillAppear()
    func viewDidDisappear()
}

final class LogInVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: LogInPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonLogIn: UIButton!
    @IBOutlet private weak var buttonSendCommand: UIButton!
    
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
    
    @IBAction private func loginHandler(_ sender: Any) {
        presenter?.logInAction()
    }
    
    @IBAction private func sendCommandHandler(_ sender: Any) {
        presenter?.sendCommand()
    }
    
    private func configure() {
        title = L10n.View.Login.title
        
        buttonLogIn.stylePrimaryAction(with: L10n.View.Login.Button.login)
        buttonSendCommand.stylePrimaryAction(with: L10n.View.Login.Button.sendCommand)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.stylePrimaryBackground()
        navigationController?.styleBase()
    }
}

extension LogInVC: LogInView {
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
    
    func updateSendMessageButton(availability: Bool) {
        buttonSendCommand.isEnabled = availability
    }
}
