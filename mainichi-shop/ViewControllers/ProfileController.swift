//
//  ProfileController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/3/23.
//

import UIKit
import ActionKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var notifyLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Profile"
        
        self.profilePhotoImageView.applyCorner(cornerRadius: self.profilePhotoImageView.frame.size.width/2.0, borderWidth: 1.0, borderColor: .cyan)
        
        self.notifySwitch.addControlEvent(.valueChanged) {
            print("switch --> \(self.notifySwitch.isOn)")
            if self.notifySwitch.isOn {
                self.notifyLabel.text = "Notify Me when order processed"
            } else {
                self.notifyLabel.text = "Don't Notify Me when order processed"
            }
        }
        let singleTapGestureRecognizer = UITapGestureRecognizer(){
            self.view.backgroundColor = self.getRandomColor()
        }
        self.notifyLabel.isUserInteractionEnabled = true
        self.notifyLabel.addGestureRecognizer(singleTapGestureRecognizer)
        
        self.nameLabel.text = "Alī ibn Abī Ṭālib"
        self.bioLabel.text = "Ali was a cousin of Muhammad. He was raised by Mohammed from the age of 5 and accepted Mohammed's claim of divine revelation by age 11, being among the first to do so. Ali played a pivotal role in the early years of Islam while Muhammad was in Mecca and under severe persecution. After Muhammad's relocation to Medina in 622, Ali married his daughter Fatima, becoming Mohammed's son-in-law. Ali fathered, among others, Hasan and Husayn, the second and third Shia Imams."

    }
    func getRandomColor () -> UIColor {
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber(), alpha: randomNumber())
    }
    
    func randomNumber() -> Double {
        return Double(arc4random() % 255) / 255.0
    }
}
