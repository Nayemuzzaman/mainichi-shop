//
//  CategoryController.swift
//  mainichi-shop
//
//  Created by Nayemuzzaman on 10/2/23.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    let products: [DisplayProduct] = [
        DisplayProduct(id: 1, name: "Football", description: "Football, also called association football or soccer, is a game involving two teams of 11 players who try to maneuver the ball into the other team's goal without using their hands or arms. The team that scores more goals wins.", discountedPrice: 40.0, originalPrice: 60.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Cricket Bat", description: "cricket bat high quality", discountedPrice: 90.0, originalPrice: 130.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Hockey Stick", description: "Hockey stick mid range", discountedPrice: 90.0, originalPrice: 120.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Rugby Ball", description: "Rugby ball description", discountedPrice: 90.0, originalPrice: 110.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Adidas shoe", description: "Adidas shoe description", discountedPrice: 80.0, originalPrice: 100.0, addedCount: 0),
        DisplayProduct(id: 1, name: "Puma Jersey", description: "Puma shoe description", discountedPrice: 90.0, originalPrice: 100.0, addedCount: 0),
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Category Search"
        
        self.mCollectionView.dataSource = self
        self.mCollectionView.delegate = self
        
        self.mCollectionView.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        
        let productNib = UINib(nibName: CellIdentifier.prouctCell, bundle: nil)
        
        self.mCollectionView.register(productNib, forCellWithReuseIdentifier: CellIdentifier.prouctCell)
        
        let categoryHolderNib = UINib(nibName: CellIdentifier.CategoryHolderCell, bundle: nil)
        self.mCollectionView.register(categoryHolderNib, forCellWithReuseIdentifier: CellIdentifier.CategoryHolderCell)
        
        let sectionHeaderNib = UINib(nibName: CellIdentifier.collectionSectionHeaderView, bundle: nil)
        self.mCollectionView.register(sectionHeaderNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.collectionSectionHeaderView)
    }

}
extension CategoryController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return self.products.count
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let categoryHolderCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.CategoryHolderCell, for: indexPath) as! CategoryHolderCell
            return categoryHolderCell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.prouctCell, for: indexPath) as! ProductCell
            let product = self.products[row]
            cell.setProductInformation(product: product)
            return cell
        }
    }
}

extension CategoryController: UICollectionViewDelegate{
    
}
extension CategoryController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        if(section == 0){
            return CGSize(width: self.view.frame.width, height: 120.0)
        }
        return sizeForItem()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = mCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.collectionSectionHeaderView, for: indexPath) as! CollectionSectionHeaderView
        if indexPath.section == 0 {
            header.headerTitleLabel.text = "Product Categories"
        } else {
            header.headerTitleLabel.text = "Popular Products"
        }
        return header
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50.0)
    }
}

extension CategoryController {
    func sizeForItem () -> CGSize {
        let screenWidth = self.view.frame.width
        let spacingBetweenItems = 10.0
        let spacingAtEdges = 10.0
        let numberOfItemsInEachRow = 2
        
        let totalSpacing = (spacingAtEdges * 2) + (Double ((numberOfItemsInEachRow - 1 )) * spacingBetweenItems)
        let itemWidth = (screenWidth - totalSpacing) / 2
        
        return CGSize(width: itemWidth, height: 265.0)
    }
}
