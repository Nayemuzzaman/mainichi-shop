//
//  SearchController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/2/23.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let products: [Product] = [
        Product(id: 1, name: "Football", description: "Standard football mid range", inStock: true),
        Product(id: 1, name: "Cricket Bat", description: "cricket bat high quality", inStock: true),
        Product(id: 1, name: "Hockey Stick", description: "Hockey stick mid range", inStock: false),
        Product(id: 1, name: "Rugby Ball", description: "Rugby ball description", inStock: false),
        Product(id: 1, name: "Adidas shoe", description: "Adidas shoe description", inStock: false),
        Product(id: 1, name: "Puma Jersey", description: "Puma shoe description", inStock: true),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Search products"
        
        self.mTableView.dataSource = self
        self.mTableView.delegate = self
        
        self.mTableView.register(UINib(nibName: CellIdentifier.searchCell, bundle: nil), forCellReuseIdentifier: CellIdentifier.searchCell)
        
        self.mTableView.estimatedRowHeight = 85.0
        self.mTableView.rowHeight = UITableView.automaticDimension
    }
}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: SearchCell!
        if let mcell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.searchCell) as? SearchCell {
            cell = mcell
        }
        
       // cell.accessoryType = .disclosureIndicator
        let product = self.products[indexPath.row]
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        
        if product.inStock {
            cell.stockLabel.text = "In Stock"
            cell.stockLabel.textColor = UIColor.green
        }else{
            cell.stockLabel.text = "Out of stock"
            cell.stockLabel.textColor = UIColor.lightGray
        }
        
        let image = UIImage(systemName: "soccerball")?.withRenderingMode(.alwaysTemplate)
        cell.productImage.image = image
        cell.productImage.tintColor = .brown

        return cell
        
    }
}
