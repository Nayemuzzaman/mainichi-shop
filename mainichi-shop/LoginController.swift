//
//  LoginController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 9/25/23.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
