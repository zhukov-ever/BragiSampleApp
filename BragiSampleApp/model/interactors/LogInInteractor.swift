//
//  LogInInteractor.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

class LogInInteractor {
    
    private let connectionService: ConnectionService
    private let commandsService: CommandsService
    
    private let bag = DisposeBag()
    private let sendMessageStopTrigger = PublishSubject<Void>()
    
    init(sl: ServiceLocator) {
        self.connectionService = sl.connectionService
        self.commandsService = sl.commandsService
    }
    
    func establishConnection() -> Observable<Result<ConnectionState, ConnectionError>>? {
        return connectionService
            .establishConnectionIfNeeded()
            .take(until: sendMessageStopTrigger)
    }
    
    func sendMessage() -> Observable<Result<Void, ConnectionError>> {
        let observable = connectionService.sendMessage()
        
        observable.subscribe( onNext: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.sendMessageStopTrigger.onNext(())
            case .failure:
                break
            }
        }).disposed(by: bag)
        
        return observable
    }
    
    func sendCommands() -> Observable<Void> {
        return commandsService.sendCommands()
    }
    
}
