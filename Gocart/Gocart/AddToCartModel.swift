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
class AddToCartModel: ObservableObject {
    
    /// Variable declarations.
    var dataArray: [GoCartModel] = []
    @Published var selectedImage :UIImage? = nil
    @Published var pickerImage :PhotosPickerItem? = nil {
        
        didSet {
            configureImage(from: pickerImage)
        }
    }
    
    /// configureImage - this function converts a data to a type UIImage that is suitable for image view .
    /// - Parameter selection: PhotosPickerItem is the type and is used to store photo from the photospicker.
    func configureImage(from selection:PhotosPickerItem?) {
        guard let selection else{return}
        
        Task {
            if let dataImage = try await selection.loadTransferable(type: Data.self){
                DispatchQueue.main.async {
                    if let itemIMG = UIImage(data: dataImage) {
                        self.selectedImage = itemIMG
                    }
                }
            }
        }
    }
    
    /// addItems - function to append item details to the main array.
    /// - Parameters:
    ///   - itemName: String value
    ///   - itemImage: Image value
    @MainActor
    func addItems (itemName:String, itemImage :Image){
        let item1 =  GoCartModel(itemName: itemName, itemImage: itemImage)
        self.dataArray.append(item1)
    }
}
