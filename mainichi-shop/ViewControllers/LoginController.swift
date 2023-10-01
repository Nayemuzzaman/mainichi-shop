//
//  LoginController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 9/25/23.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordFeild: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor = UIColor(named: "theme200") ?? UIColor.systemCyan
        self.logoImageView.applyCorner(cornerRadius: 15.0, borderWidth: 1.0, borderColor: borderColor)
        
        self.passwordFeild.becomeFirstResponder()

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickLoginButton() {
        let alertController = UIAlertController(title: "Click Event", message: "Login button clicked", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "close", style: .cancel)
        alertController.addAction(closeAction)
        self.present(alertController, animated: true)
    }

}
