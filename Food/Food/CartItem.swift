//
//  CartItem.swift
//  Food
//
//  Created by Shahid on 01/04/25.
//

import Foundation

// MARK: - Cart Item Struct
struct CartItem: Codable {
    let name: String
    let price: Int
    var quantity: Int
}
