//
//  homeTableViewCell.swift
//  OPTOMNI
//
//  Created by Kareem Elfadaly on 10/08/2022.
//

import UIKit

class homeTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemWeightLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
        itemNameLabel.text = nil
        itemWeightLabel.text = nil
        itemPriceLabel.text = nil
    }

    func setDataToView(data:Fruit) {
        itemImageView.downloaded(from: data.image ?? "")
        itemNameLabel.text = data.name
        itemWeightLabel.text = ((data.weight == nil) || (data.weight == 0)) ? "" : "\(data.weight!)"
        itemPriceLabel.text = String(data.price ?? 0) + "$"
    }
    
}
