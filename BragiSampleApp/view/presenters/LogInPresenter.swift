//
//  LogInPresenter.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit
import RxSwift

protocol LogInView: UIViewController {
    func show(message: MessageType)
    func updateSendMessageButton(availability: Bool)
}

final class LogInPresenter {
    
    private let bag = DisposeBag()
    private var disposableConnectionState: Disposable?
    
    private weak var view: LogInView?
    private let coordinator: Coordinating
    private let interactor: LogInInteractor
    
    private var latestMessage: MessageType?

    internal init(view: LogInView?,
                  coordinator: Coordinating,
                  interactor: LogInInteractor) {
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

extension LogInPresenter: LogInPresenting {
    func logInAction() {
        interactor.sendMessage()
            .subscribe(onNext: { [weak self] result in
                switch result {
                case .success:
                    guard let self = self else { return }
                    
                    let message = MessageType.messageSent(L10n.Alert.MessageSent.title)
                    self.updateViewIfNeeded(with: message)
                    
                    let coordinator = SignUpCoordinator(navigationController: self.view?.navigationController,
                                                        sl: self.coordinator.sl)
                    coordinator.start()
                case .failure:
                    break
                }
        }).disposed(by: bag)
    }
    
    func sendCommand() {
        view?.updateSendMessageButton(availability: false)
        interactor.sendCommands().subscribe(onCompleted: { [weak self] in
            self?.view?.updateSendMessageButton(availability: true)
        }).disposed(by: bag)
    }
    
    func viewWillAppear() {
        disposableConnectionState = interactor.establishConnection()?.subscribe(onNext: { [weak self] result in
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
        })
    }
    
    func viewDidDisappear() {
        disposableConnectionState?.dispose()
    }
}
