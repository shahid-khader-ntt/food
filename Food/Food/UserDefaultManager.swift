//
//  UserDefaultManager.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

    private let emailKey = "user_email"
    private let passwordKey = "user_password"
    private let cartKey = "user_cart"

    private let defaults = UserDefaults.standard

    // MARK: - User Credentials
    func saveUser(email: String, password: String) {
        defaults.set(email, forKey: emailKey)
        defaults.set(password, forKey: passwordKey)
    }

    func getUser() -> (email: String?, password: String?) {
        return (defaults.string(forKey: emailKey), defaults.string(forKey: passwordKey))
    }

    func isValidUser(email: String, password: String) -> Bool {
        let savedUser = getUser()
        return savedUser.email == email && savedUser.password == password
    }

    // MARK: - Cart Management
    func saveCart(items: [CartItem]) {
        if let encoded = try? JSONEncoder().encode(items) {
            defaults.set(encoded, forKey: cartKey)
        }
    }

    func getCart() -> [CartItem] {
        guard let savedData = defaults.data(forKey: cartKey),
              let decodedCart = try? JSONDecoder().decode([CartItem].self, from: savedData) else {
            return []
        }
        return decodedCart
    }

    /// **Check if a food item exists in the cart and return it**
    func getCartItem(foodName: String) -> CartItem? {
        return getCart().first(where: { $0.name == foodName })
    }

    /// **Add item to cart or update quantity, and remove if quantity reaches zero**
    func addItemToCart(food: Foods, quantity: Int) {
        var cart = getCart()

        // Check if the item exists
        if let index = cart.firstIndex(where: { $0.name == food.name }) {
            // If quantity is 0 or less, remove the item
            if quantity <= 0 {
                cart.remove(at: index)
            } else {
                cart[index].quantity = quantity // **Update the quantity instead of adding**
            }
        } else if quantity > 0 {
            // If item doesn't exist and quantity > 0, add it
            let newItem = CartItem(name: food.name, price: food.price, quantity: quantity)
            cart.append(newItem)
        }

        saveCart(items: cart)
    }


    /// **Remove an item from the cart completely**
    func removeItemFromCart(food: Foods) {
        var cart = getCart()
        cart.removeAll { $0.name == food.name }
        saveCart(items: cart)
    }

    func clearCart() {
        defaults.removeObject(forKey: cartKey)
    }
    
    func logoutUser() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize() // Ensures changes are saved immediately
    }
    
    func calculateTotalBill() -> Int {
        let cart = getCart()
        return cart.reduce(0) { $0 + ($1.price * $1.quantity) }
    }


}
