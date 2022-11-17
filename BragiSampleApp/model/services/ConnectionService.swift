//
//  ConnectionService.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

enum ConnectionError: Error, Equatable {
    case unknown
}

enum ConnectionState: Equatable {
    case connecting
    case connected
}

protocol ConnectionService {
    func establishConnectionIfNeeded() -> Observable<Result<ConnectionState, ConnectionError>>
    func sendMessage() -> Observable<Result<Void, ConnectionError>>
}
