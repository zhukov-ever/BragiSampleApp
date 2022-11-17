//
//  ServiceLocator.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation

class ServiceLocator {
    
    lazy var connectionService: ConnectionService = MockConnectionService()
    
}
