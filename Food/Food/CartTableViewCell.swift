//
//  CartTableViewCell.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var cartItem: CartItem?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(cartItem: CartItem) {
        nameLabel.text = cartItem.name
        quantityLabel.text = "X \(cartItem.quantity)"
        priceLabel.text = "\(cartItem.price)"
    }
    
}
