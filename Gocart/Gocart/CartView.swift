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
                if viewModel.dataSource.isEmpty {
                    List {
                        HStack {
                            Image(systemName: "cart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            Spacer()
                            Text("Item Name")
                                .font(.headline)
                            Spacer()

                        }
                    }
                }
                List(viewModel.dataSource) {
                    value in HStack {
                        value.itemImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text(value.itemName)
                            .font(.headline)
                    }
                }.listStyle(.insetGrouped)
            }
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

#Preview {
    CartView(viewModel: CartViewModel())
}
