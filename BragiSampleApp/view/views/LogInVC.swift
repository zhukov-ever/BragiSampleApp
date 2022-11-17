//
//  LogInVC.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

protocol LogInPresenting {
    func logInAction()
}

final class LogInVC: UIViewController {
    
    // MARK: - Properties
    
    var presenter: LogInPresenting?
    
    // MARK: Private properties
    
    @IBOutlet private weak var buttonLogIn: UIButton!
    
    private lazy var messageView: MessageView = DefaultMessageView()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Methods
    // MARK: Private methods
    
    @IBAction private func loginHandler(_ sender: Any) {
//        presenter?.logInAction()
            
        showMessage()
    }
    
    private func configure() {
        title = L10n.View.Login.title
        
        buttonLogIn.stylePrimaryAction(with: L10n.View.Login.Button.login)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.stylePrimaryBackground()
        navigationController?.styleBase()
    }
    
    var i = 0
    func showMessage() {
        switch i % 4 {
        case 0:
            messageView.styleError()
            messageView.show(in: view, text: L10n.Alert.ConnectionError.title)
        case 1:
            messageView.styleWarning()
            messageView.show(in: view, text: L10n.Alert.Connecting.title)
        case 2:
            messageView.styleInfo()
            messageView.show(in: view, text: L10n.Alert.MessageSent.title)
        case 3:
            messageView.styleSuccess()
            messageView.show(in: view, text: L10n.Alert.ConnectionEstablished.title)
        default:
            break
        }
        i += 1
    }
}

extension LogInVC: LogInView {
    
}
