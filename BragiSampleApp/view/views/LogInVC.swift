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
        presenter?.logInAction()
    }
    
    private func configure() {
        title = L10n.View.Login.title
        
        buttonLogIn.stylePrimaryAction(with: L10n.View.Login.Button.login)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.stylePrimaryBackground()
        navigationController?.styleBase()
    }
    
    
}

extension LogInVC: LogInView {
    
}
