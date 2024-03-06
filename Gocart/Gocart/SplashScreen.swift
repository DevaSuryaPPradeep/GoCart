//
//  SplashScreen.swift
//  Gocart
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

struct SplashScreen: View {
    
    /// Variable declarations.
    @State var isActive :Bool = false
    @State var size: Double = 0.5
    @State var opacityValue: Double = 0.5
    
    var body: some View {
        if isActive {
            CartView()
        }
        else {
            ZStack{
                Image("SplashScreen")
                    .scaledToFit()
                    .ignoresSafeArea()
                VStack{
                    VStack{
                        Image(systemName: "cart.fill")
                            .font(.system(size: 80))
                            .foregroundColor(Color.white)
                        Text("GoCart")
                            .font(Font.custom("Baskervillie-Bold", size: 26))
                            .foregroundStyle(Color.white)
                            .opacity(0.8)
                    }
                    .scaleEffect(size)
                    .opacity(opacityValue)
                    .onAppear(perform: {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacityValue = 1.0
                        }
                    })
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
