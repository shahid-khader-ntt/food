//
//  ViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)

    }
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController?.pushViewController(registerVC, animated: true)
    }
    

}

