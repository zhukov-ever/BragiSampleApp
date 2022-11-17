//
//  MockConnectionService.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

final class MockConnectionService: ConnectionService {
    private let timerFreq = 5
    private var timer: Observable<Int>?
    
    private var latestConnectionState: Result<ConnectionState, ConnectionError>?
    
    func establishConnectionIfNeeded() -> Observable<Result<ConnectionState, ConnectionError>> {
        let timer = self.timer ?? Observable<Int>
            .interval(RxTimeInterval.seconds(1), scheduler: MainScheduler.asyncInstance)
        if self.timer == nil {
            self.timer = timer
        }

        return timer
            .filter { $0 % self.timerFreq == 0 }
            .map { [weak self] element in
                let availableStates = [
                    Result.success(ConnectionState.connecting),
                    Result.success(ConnectionState.connected),
                    Result.failure(ConnectionError.unknown)
                ].compactMap { self?.latestConnectionState != $0 ? $0 : nil }
                
                let state = availableStates[Int.random(in: 0..<availableStates.count)]
                self?.latestConnectionState = state
                return state
            }
    }
    
    func sendMessage() -> Observable<Result<Void, ConnectionError>> {
        switch latestConnectionState {
        case .success(.connected):
            return Observable.just(Result.success(()))
        default:
            return Observable.just(Result.failure(ConnectionError.unknown))
        }
    }
    
}
