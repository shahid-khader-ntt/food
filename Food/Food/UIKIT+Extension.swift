//
//  UIKIT+Extentions.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import Foundation
import UIKit

extension UINavigationController {
    func popAndPush(viewController: UIViewController) {
        var viewControllers = self.viewControllers
        if !viewControllers.isEmpty {
            viewControllers.removeLast() // Remove current VC
        }
        viewControllers.append(viewController) // Push new VC
        
        // Use a seamless transition
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        transition.subtype = .fromRight
        self.view.layer.add(transition, forKey: kCATransition)
        
        self.setViewControllers(viewControllers, animated: false)
    }
}

extension String {
    func getCapitalizedNameFromEmail() -> String {
        // Get the part before '@' in the email
        let emailPrefix = self.components(separatedBy: "@").first ?? ""
        
        // Capitalize each word (e.g., "john_doe" -> "John Doe")
        let capitalizedName = emailPrefix
            .replacingOccurrences(of: ".", with: " ") // Replace dots with spaces
            .replacingOccurrences(of: "_", with: " ") // Replace underscores with spaces
            .capitalized // Capitalize the first letter of each word
        
        return capitalizedName
    }
}
