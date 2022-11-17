//
//  ForgotPasswordPresenter.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit
import RxSwift

protocol ForgotPasswordView: UIViewController {
    func show(message: MessageType)
}

final class ForgotPasswordPresenter {
    
    private let bag = DisposeBag()
    private var disposableConnectionState: Disposable?
    
    private weak var view: ForgotPasswordView?
    private let coordinator: Coordinating
    private let interactor: ForgotPasswordInteractor
    
    private var latestMessage: MessageType?

    internal init(view: ForgotPasswordView?,
                  coordinator: Coordinating,
                  interactor: ForgotPasswordInteractor) {
        self.view = view
        self.coordinator = coordinator
        self.interactor = interactor
    }
    
    private func updateViewIfNeeded(with message: MessageType) {
        if self.latestMessage != message {
            self.latestMessage = message
            self.view?.show(message: message)
        }
    }

}

extension ForgotPasswordPresenter: ForgotPasswordPresenting {
    func forgotPasswordAction() {
        interactor.sendMessage()
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success:
                    guard let self = self else { return }
                    
                    let message = MessageType.messageSent(L10n.Alert.MessageSent.title)
                    self.updateViewIfNeeded(with: message)
                case .failure:
                    break
                }
        }).disposed(by: bag)
    }
    
    func viewDidLoad() {
        interactor.establishConnection()?.subscribe(onNext: { [weak self] result in
            guard let self = self else { return }
            
            let message: MessageType
            switch result {
            case .success(.connecting):
                message = .connecting(L10n.Alert.Connecting.title)
            case .success(.connected):
                message = .connected(L10n.Alert.ConnectionEstablished.title)
            case .failure(_):
                message = .connectionError(L10n.Alert.ConnectionError.title)
            }
            
            self.updateViewIfNeeded(with: message)
        }).disposed(by: bag)
    }
    
}
