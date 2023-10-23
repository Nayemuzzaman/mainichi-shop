//
//  TutorialContentController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/21/23.
//

import UIKit

class TutorialContentController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    
    var page: Page!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.page.title
        self.descriptionLabel.text = self.page.description
        self.slideImageView.image = page.image
        self.getStartedButton.isHidden = page.pageIndex != 2
    }

}
