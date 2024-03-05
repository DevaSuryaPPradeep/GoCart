//
//  CartViewModel.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import Foundation

class CartViewModel: ObservableObject {
    var title: String = "Cart"
    var iconImage :String = "cart.fill"
    @Published var dataSource: [GoCartModel] = []
}
