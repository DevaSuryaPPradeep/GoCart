//
//  GoCartModel.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import Foundation
import SwiftUI

struct GoCartModel: Identifiable {
    let id :String = UUID().uuidString
    let itemName :String
    let itemImage :Image
}
