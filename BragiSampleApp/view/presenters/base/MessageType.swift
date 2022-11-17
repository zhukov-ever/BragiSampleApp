//
//  MessageType.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation

enum MessageType: Equatable {
    case connected(String)
    case connecting(String)
    case connectionError(String)
    case messageSent(String)
}
