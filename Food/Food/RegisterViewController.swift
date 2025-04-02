//
//  RegisterViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func regiisterButtonAction(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            AlertManager.shared.showAlert(on: self, title: "Too short", message: "Email or password too short")
            return
        }
        UserDefaultsManager.shared.saveUser(email: email, password: password)
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.popAndPush(viewController: loginVC)
    }
    
}
