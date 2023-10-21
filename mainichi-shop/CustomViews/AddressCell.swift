//
//  AddressCell.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/20/23.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    public static let cellId = "AddressCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
