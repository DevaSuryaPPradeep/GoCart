//
//  CartViewModel.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import Foundation
import SwiftUI
import PhotosUI

/// ViewModel for the AddCart view.
class CartViewModel :ObservableObject {
    
    /// Variable declarations.
    @Published var dataArray :[GoCartModel] = []
    @Published private (set)var selectedImage :UIImage? = nil
    @Published var pickerImage :PhotosPickerItem? = nil
    
    /// addItems - function to append item details to the main array.
    /// - Parameters:
    ///   - itemName: String value
    ///   - itemImage: Image value
    func addItems (itemName:String, itemImage :Image){
        let item1 =  GoCartModel(itemName: itemName, itemImage: itemImage)
        dataArray.append(item1)
    }
    
}
