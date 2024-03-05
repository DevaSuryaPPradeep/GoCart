//
//  AddToCartView.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI
import PhotosUI

/// View
struct AddToCartView: View {
    
    /// Variable Declarations.
    @State var textValue :String = ""
    @State var alertBool :Bool = false
    @State var screenTransition: Bool = false
    @StateObject var viewModelInstance = AddToCartModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var dataSource: [GoCartModel]
        
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    TextField("Enter your item name here", text: $textValue)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .opacity(0.5)
                        .foregroundStyle(Color.black)
                        .font(.headline)
                }
                .padding()
                PhotosPicker(selection: $viewModelInstance.pickerImage) {
                    Text("choose an Image here")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                }
                .padding()
                if  viewModelInstance.selectedImage == nil {
                    Image (systemName: "photo.fill")
                        .resizable()
                        .frame(width: 200,height: 200)
                        .scaledToFit()
                        .clipped()
                    Spacer()
                }
                else if let imageValue = viewModelInstance.selectedImage {
                    Image(uiImage: imageValue)
                        .resizable()
                        .frame(width: 200,height: 200)
                        .scaledToFit()
                        .clipped()
                    Spacer()
                }
                Spacer()
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 300,height: 50)
                    .overlay {
                        Button{
                            if viewModelInstance.selectedImage == nil, textValue.isEmpty {
                                alertBool.toggle()
                            } else if let selectedImage = viewModelInstance.selectedImage {
                            viewModelInstance.addItems(itemName: textValue, itemImage: Image(uiImage: selectedImage))
                                print("dataArray-->\(viewModelInstance.dataArray.count)")
                                dataSource.append(contentsOf: viewModelInstance.dataArray)
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            Text("Add To Cart")
                                .font(.headline)
                                .foregroundStyle(Color.white)
                                .bold()
                        }
                        .alert("Alert", isPresented: $alertBool) {
                            Text("Fix it.")
                        } message: {
                            Text("Missing of mandidate fields.")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }
                    }
            }
            .navigationTitle("Item Descriptions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
//
//#Preview {
////    AddToCartView( dataSource: Binding<[GoCartModel]>())
//}
