//
//  AddToCart.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI
import PhotosUI

struct AddToCart: View {
    @State var textValue :String = ""
    @StateObject var viewModelInstance = CartViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    TextField("Enter your item name here", text: $textValue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                        .opacity(0.5)
                }
                .padding()
                Spacer()
                PhotosPicker(selection: $viewModelInstance.pickerImage) {
                    Text("choose an Image here")
                        .font(.headline)
                }
                if let image = viewModelInstance.$selectedImage {
                    Image()
                        .resizable()
                        .frame(width: 200,height: 200)
                }
          }
            .navigationTitle("Item Descriptions")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    AddToCart()
}
