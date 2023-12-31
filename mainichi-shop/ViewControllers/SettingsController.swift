//
//  SettingsController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/2/23.
//

import UIKit

class SettingsController: UIViewController {
    
    var items = ["My Profile", "My Address", "Wishlist", "My Orders", "Settings", "Create Product", "Logout"]
    @IBOutlet weak var mTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Settings"
        
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
    }

}


extension SettingsController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        if let mcell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? UITableViewCell {
            cell = mcell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            if let profileController = self.storyboard?.instantiateViewController(withIdentifier: Constants.profileController) as? ProfileController {
                self.navigationController?.pushViewController(profileController, animated: false)
            }
        } else if indexPath.row == 1 {
            if let addressController = self.storyboard?.instantiateViewController(withIdentifier: Constants.addressController) as? AddressController {
                self.navigationController?.pushViewController(addressController, animated: false)
            }
        } else if indexPath.row == 4 {
            if let createProductController = self.storyboard?.instantiateViewController(withIdentifier: Constants.createProductController) as? CreateProductController {
                self.navigationController?.pushViewController(createProductController, animated: true)
            }
        }

        
    }
}











