//
//  AlertManager.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import Foundation

import UIKit

class AlertManager {
    static let shared = AlertManager() // Singleton instance
    
    private init() {} // Prevent external instantiation

    func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
