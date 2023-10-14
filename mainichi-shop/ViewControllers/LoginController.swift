//
//  LoginController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 9/25/23.
//

import UIKit
import Alamofire
import MBProgressHUD

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
        
        self.title = "Login"

    }
    
    @IBAction func onClickLoginButton() {
        
        if self.validateLoginInfo() {
            let email = self.usernameField.text!
            let password = self.passwordFeild.text!
            self.login(email: email, password: password)
        }
        
    }
    func validateLoginInfo () -> Bool {
        guard let email = self.usernameField.text, email.isValidEmail() else {
            self.displayAlert(title: "Email invalid", message: "Please enter valid email" )
            return false
        }
        guard let password = self.passwordFeild.text, password.isValidPassword() else {
            self.displayAlert(title: "Password too short", message: "password at least 6 character long" )
            return false
        }
        return true
    }
    
    func login( email: String,  password: String) {
        let url = RestClient.baseUrl + RestClient.loginURL
        let loginRequest = LoginRequest(email: email, password: password)
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        AF.request(url, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil, requestModifier: nil).responseDecodable(of: LoginResponse.self) {
            response in
            MBProgressHUD.hide(for: self.view, animated: true)
            
            switch (response.result){
                case .success:
                    print(response)
                if let responseData = response.value {
                    if let accessToken = responseData.access_token {
                        self.writeToUserDefaults(key: "accessToken", value: accessToken)
                        self.navigate()
                    } else if let statusCode = responseData.statusCode, let message = responseData.message{
                        self.displayAlert(title: "Login Failed", message: message)
                    }
                }
                case let .failure(error):
                    print(error)
                
            }
        }
    }
    
    func navigate() {
        if let currentWindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            //sceneDelegate
            if let sceneDelegate = currentWindowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
                //print(window.rootViewController)
                
               if let tabController = self.storyboard?.instantiateViewController(withIdentifier: Constants.tabController) as? UITabBarController     {
                    window.rootViewController = tabController
                }
            }
        }
    }
    
    @IBAction func onClickSignUpButton() {
        if let signupController = self.storyboard?.instantiateViewController(withIdentifier: Constants.signupController) as? SignupController {
            self.navigationController?.pushViewController(signupController, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let signupController = segue.destination as? SignupController {
            signupController.value = 2
        }
    }
    

}
