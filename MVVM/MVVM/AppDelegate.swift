//
//  AppDelegate.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        setLoginControllerAsRoot()
        return true
    }
    
    func setLoginControllerAsRoot() {
        let loginVC = STORYBOARD.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let navigationVC = UINavigationController(rootViewController: loginVC)
        self.window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: {
           
        }, completion: { completed in
        })
    }
}

