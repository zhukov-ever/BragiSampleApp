//
//  AppDelegate.swift
//  BragiSampleApp
//
//  Created by Nikita Zhukov on 16.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var sl: ServiceLocator
    
    override init() {
        sl = ServiceLocator()
        super.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        self.window = window
        
        let nvc = UINavigationController()
        
        let logInCoordinator = LogInCoordinator(navigationController: nvc, sl: sl)
        logInCoordinator.start()
            
        window.rootViewController = nvc
        window.makeKeyAndVisible()
        
        return true
    }
    
}

