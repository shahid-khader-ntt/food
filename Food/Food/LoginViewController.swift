//
//  LoginViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let isValidUser = UserDefaultsManager.shared.isValidUser(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        if isValidUser {
            // Get the current scene's window
            if let window = UIApplication.shared.windows.first {
                UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
                    window.rootViewController = MainTabBarController()
                })
            }
        } else {
            AlertManager.shared.showAlert(on: self, title: "Login Error", message: "Invalid username or password")
        }
    }

}
