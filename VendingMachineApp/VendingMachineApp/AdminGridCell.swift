//
//  AdminGridCell.swift
//  VendingMachineApp
//
//  Created by hw on 12/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit

class AdminGridCell: UICollectionViewCell {
    @IBOutlet var imgView: DrinkUIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var stockInfoLabel: UILabel!
    
    private var itemIndex: Int!
    
    @IBAction func addDrinkStockButton(_ sender: UIButton) {
        guard let stockSize = Int((stockInfoLabel.text!.components(separatedBy: "개")[0])) else{
            return
        }
        guard let index = itemIndex else {
            return
        }
        NotificationCenter.default.post(name: .addDrinkButton, object: index)
    }
    
    private func setImage(_ index: Int) {
        guard let img: UIImage = UIImage.init(named: "\(index).jpg") else{
            return
        }
        imgView.image = img
    }
    
    func updateDrinkInfo(drinkStockSize: Int, index: Int){
        let img: UIImage = UIImage.init(named: "\(index).jpg")!
        imgView.image = img
        stockInfoLabel.text = "\(drinkStockSize)개"
        itemIndex = index
    }
    
    func configureButtonStyle(){ addButton.setTitle(GridCellTextSet.charge.rawValue, for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
    }
}

extension Notification.Name {
    static let addDrinkButton = Notification.Name(rawValue: "AddDrinkEvent")
}
