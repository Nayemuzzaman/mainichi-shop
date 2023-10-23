//
//  ViewController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 9/24/23.
//

import UIKit

class SplashController: UIViewController {

    @IBOutlet var label: UILabel!
    var timer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewwill appear ")
        super.viewWillAppear(animated)
    }
 
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(makeTransition), userInfo: nil, repeats: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdid appear")
        super.viewDidAppear(animated)
    }
    
    @objc func makeTransition() {
        print("timer ended")
        self.timer?.invalidate()
        
        if let currentWindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            //sceneDelegate
            if let sceneDelegate = currentWindowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
                //print(window.rootViewController)
                
                let userDefaults = UserDefaults.standard
                let tutorialSeen = userDefaults.bool(forKey: "tutorialSeen")
                if tutorialSeen == true {
                    if let authViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.authNavigationController) as? UINavigationController     {
                         window.rootViewController = authViewController
                     }
                }else {
                    if let tutorialController = self.storyboard?.instantiateViewController(withIdentifier: Constants.tutorialController) as? TutorialController {
                        window.rootViewController = tutorialController
                    }
                }
            }
        }
    }
}

