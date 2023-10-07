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

    }
}
