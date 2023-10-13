//
//  UIViewControllerExtension.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/13/23.
//

import Foundation
import UIKit

extension UIViewController {
    func displayAlert (title: String, message: String) {
        let closeActionButton = UIAlertAction(title: "Close", style: .cancel)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(closeActionButton)
        self.present(alertController, animated: true)
    }
}
