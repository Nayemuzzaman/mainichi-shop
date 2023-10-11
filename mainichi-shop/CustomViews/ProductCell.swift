//
//  ProductCell.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/10/23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setProductInformation (product: DisplayProduct){
        self.productImageView.image = UIImage(systemName: "football")
        self.productNameLabel.text = product.name
        self.productDescriptionLabel.text = product.description
        
        let strokeEffect: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.red
        ]
        
        let originalPrice = NSAttributedString(string: "$ " + String(product.originalPrice), attributes: strokeEffect)
        let finalAttributedString = NSMutableAttributedString()
        finalAttributedString.append(originalPrice)
        finalAttributedString.append(NSAttributedString(string: " $ "))
        finalAttributedString.append(NSAttributedString(string: String(product.discountedPrice)))
        self.productPriceLabel.attributedText = finalAttributedString
    }

}
