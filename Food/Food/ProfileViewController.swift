//
//  ProfileViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = UserDefaultsManager.shared.getUser()
        nameLabel.text = user.email?.getCapitalizedNameFromEmail()
    }
    

    @IBAction func logoutButtonAction(_ sender: Any) {
        UserDefaultsManager.shared.logoutUser()
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: vc)
        if let window = UIApplication.shared.windows.first {
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: {
                window.rootViewController = navigationController
            })
        }
        
    }
    

}
