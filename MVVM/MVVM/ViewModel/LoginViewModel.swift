//
//  LoginViewModel.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import Foundation

class LoginViewModel {
    
    private var user = User()
    var loginResponse : Observable<LoginModel?> = Observable(nil)
    func updateCredentials(username:String,password:String) {
        user.username = username
        user.password = password
    }
}

extension LoginViewModel {
    func LoginAPI() {
        let param = [
            "identity":user.username,
            "password":user.password
        ] as [String : Any]
        
        APIManager.shared.apiRequest(apiName: LOGIN_API, parameters: param) { (response) in
            print(response)
            self.loginResponse.value = response as? LoginModel
        } failed: { (error) in
            
        }
    }
    
    func validate() -> Bool {
        if user.username.isEmpty && user.password.isEmpty {
            AlertController.showAlert(title: "Alert!", message: "Please enter username & password", completion: nil)
            return false
        }
        if user.username.isEmpty {
            AlertController.showAlert(title: "Alert!", message: "Please enter username", completion: nil)
            return false
        }
        if user.password.isEmpty {
            AlertController.showAlert(title: "Alert!", message: "Please enter password", completion: nil)
            return false
        }
        return true
    }
}


class User {
    var username: String = ""
    var password: String = ""
}
