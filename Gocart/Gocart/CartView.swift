//
//  ContentView.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel = CartViewModel()
    @State var screentranstion:Bool  = false
    
    var body: some View {
        NavigationStack{
            VStack {
                List{
                    if  viewModel.dataSource.isEmpty{
                        
                        HStack{
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                            Spacer()
                            Text("Item Name")
                                .font(.headline)
                            Spacer()
                        }
                    }
                    
                    ForEach(viewModel.dataSource){
                        value in HStack {
                            value.itemImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                            Text(value.itemName)
                                .font(.headline)
                        }
                    }
                    .onDelete(perform: { Indexpath in
                        viewModel.delete(_index: Indexpath)
                    })
                }
                
                
                .listStyle(.insetGrouped)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            screentranstion.toggle()
                        }
                    label:{
                        Image(systemName: viewModel.iconImage
                        )
                        .foregroundStyle(Color.black)
                    }
                    }
                })
                .navigationDestination(isPresented: $screentranstion, destination: {
                    AddToCartView(dataSource: $viewModel.dataSource)
                })
                .navigationTitle(viewModel.title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel())
}
