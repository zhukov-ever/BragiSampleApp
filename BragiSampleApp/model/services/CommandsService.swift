//
//  CommandsService.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

protocol CommandsService {
    
    func sendCommands() -> Observable<Void>
    
}
