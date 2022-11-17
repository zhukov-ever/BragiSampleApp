//
//  Coordinating.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import Foundation

protocol Coordinating {
    var sl: ServiceLocator { get }
    func start()
}
