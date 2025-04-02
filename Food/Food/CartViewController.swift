//
//  CartViewController.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var tableViewContainer: UIView!
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var cartItems: [CartItem] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeButton.layer.cornerRadius = 5
        tabelView.delegate = self
        tabelView.dataSource = self
        
        let nib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tabelView.register(nib, forCellReuseIdentifier: "CartTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchCartItems()
        let total = UserDefaultsManager.shared.calculateTotalBill()
        totalPrice.text = "\(total)"
    }
    
    func fetchCartItems() {
        cartItems = UserDefaultsManager.shared.getCart()
        tabelView.reloadData()
        if cartItems.isEmpty {
            tableViewContainer.isHidden = true
        } else {
            tableViewContainer.isHidden = false
        }
        
        tabelView.reloadData()
    }
    
    @IBAction func completeButtonAction(_ sender: Any) {
        AlertManager.shared.showAlert(on: self, title: "Success", message: "Purchase Successful")
        UserDefaultsManager.shared.clearCart()
        fetchCartItems()
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.setupUI(cartItem: cartItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
