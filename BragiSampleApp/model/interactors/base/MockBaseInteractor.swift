//
//  MockBaseInteractor.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

class MockBaseInteractor {
    
    private let connectionService: ConnectionService
    private let bag = DisposeBag()
    private let trigger = PublishSubject<Void>()
    
    
    init(sl: ServiceLocator) {
        self.connectionService = sl.connectionService
    }
    
    func establishConnection() -> Observable<Result<ConnectionState, ConnectionError>>? {
        return connectionService
            .establishConnectionIfNeeded()
            .take(until: trigger)
    }
    
    func sendMessage() -> Observable<Result<Void, ConnectionError>> {
        let observable = connectionService.sendMessage()
        
        observable.subscribe( onNext: { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.trigger.onNext(())
            case .failure:
                break
            }
        }).disposed(by: bag)
        
        return observable
    }
    
}
