//
//  FoodsTableViewCell.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    var food: Foods?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        foodImageView.layer.cornerRadius = 10
        setUpQuantity(quantity: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(food: Foods) {
        self.food = food
        foodImageView.image = UIImage(named: food.imageName)
        foodTitle.text = food.name + " - " + String(food.price)
        
        let foodInCart = UserDefaultsManager.shared.getCartItem(foodName: food.name)
        if let foodInCart = foodInCart {
            setUpQuantity(quantity: foodInCart.quantity)
        } else {
            setUpQuantity(quantity: 0)
        }
    }
    
    @IBAction func minusAction(_ sender: Any) {
        var quantity = Int(quantityLabel.text!) ?? 0
        quantity -= 1
        setUpQuantity(quantity: quantity)
        if let food = food{
            UserDefaultsManager.shared.addItemToCart(food: food, quantity: quantity)
        }
        
    }
    
    @IBAction func plusAction(_ sender: Any) {
        var quantity = Int(quantityLabel.text!) ?? 0
        quantity += 1
        setUpQuantity(quantity: quantity)
        if let food = food{
            UserDefaultsManager.shared.addItemToCart(food: food, quantity: quantity)
        }
    }
    
    func setUpQuantity(quantity: Int) {
        quantityLabel.text = "\(quantity)"
        if quantity <= 0 {
            minusButton.isEnabled = false
            plusButton.isEnabled = true
        } else if quantity >= 2 {
            minusButton.isEnabled = true
            plusButton.isEnabled = false
        } else {
            minusButton.isEnabled = true
            plusButton.isEnabled = true
        }
        
    }
    
    
    
}
