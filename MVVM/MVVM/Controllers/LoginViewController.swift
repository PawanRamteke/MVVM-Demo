//
//  ViewController.swift
//  MVVM
//
//  Created by TIU-User on 23/12/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        txtFieldEmail.text = "pawan.photographer@mailinator.com"
        txtFieldPassword.text = "123456"
        
        bindData()
    }

    @IBAction func btnLoginClicked(_ sender: Any) {
        self.view.endEditing(true)
        viewModel.updateCredentials(username: txtFieldEmail.text!, password: txtFieldPassword.text!)
        
        if viewModel.validate() {
            viewModel.LoginAPI()
        }
    }
    
    func bindData() {
        viewModel.loginResponse.bind { (loginModel) in
            if let _ = loginModel {
                DispatchQueue.main.async {
                    AlertController.showAlert(title: "Success", message: "User Login Successfully", completion: nil)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}

