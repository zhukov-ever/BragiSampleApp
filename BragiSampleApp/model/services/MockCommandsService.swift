//
//  MockCommandsService.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 17.11.2022.
//

import Foundation
import RxSwift

final class MockCommandsService: CommandsService {
    
    private enum Strings {
        static let debugRequrenmentsViolation = "requirenments violation"
        static let debugCommandID: (Int) -> String = { secs in "command ID \(secs) is completed" }
        static let debugAllDone = "all commands are completed"
    }
    
    private let queueLabel = "com.bragi.command_service"
    
    private var commandGroups: DispatchGroup?
    private var observable: PublishSubject<Void>?
    
    func sendCommands() -> Observable<Void> {
        if let observable = observable {
            Log.debug(in: self, message: Strings.debugRequrenmentsViolation)
            return observable
        }
        
        let observable = PublishSubject<Void>()
        self.observable = observable
        
        startService(capacity: MockConstants.numberOfSendCommand)
        
        return observable
    }
    
    private func startService(capacity: Int) {
        let queue = DispatchQueue(label: queueLabel, qos: .background)
        commandGroups = DispatchGroup()
        
        [Int](1...capacity).map { secs in
            DispatchWorkItem {
                sleep(UInt32(secs))
                Log.debug(in: self, message: Strings.debugCommandID(secs))
            }
        }.forEach { workItem in
            guard let commandGroups = commandGroups else { return }
            queue.async(group: commandGroups, execute: workItem)
        }
        
        commandGroups?.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            Log.debug(in: self, message: Strings.debugAllDone)
            
            self.observable?.onCompleted()
            self.clean()
        }
    }
    
    private func clean() {
        observable?.dispose()
        observable = nil
        commandGroups = nil
    }
    
}
