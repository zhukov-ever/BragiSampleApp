//
//  Log.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation

class Log {
    static func debug(in object: AnyObject, message: Any) {
        print("[DEBUG] \(String(describing: object)): \(message)")
    }
}
