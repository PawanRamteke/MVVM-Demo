//
//  AlertController.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import Foundation
import UIKit

class AlertController {
    class func showAlert(title:String,message: String,completion: (()->Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            completion?()
        }
        alert.addAction(ok)
        topMostController().present(alert, animated: true, completion: nil)
    }
    
    
    class func topMostController() -> UIViewController
    {
        var topViewController = UIApplication.shared.keyWindow?.rootViewController
        while true {
            if topViewController?.presentedViewController != nil {
                topViewController = topViewController?.presentedViewController
            }
            else if (topViewController is UITabBarController) {
                let tab = topViewController as? UITabBarController
                topViewController = tab?.selectedViewController
                break
            }
            else {
                break
            }
        }
        return topViewController!
    }
}
