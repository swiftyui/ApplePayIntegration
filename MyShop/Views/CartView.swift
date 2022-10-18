//
//  CartView.swift
//  MyShop
//
//  Created by Arno van Zyl on 2022/10/18.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shopItemModel: ShopItemModel
    @State var payHandler = PaymentHandler()
    @State var total: Double = 0
    
    var body: some View {
        
        VStack{
            List{
                ForEach($shopItemModel.cart.items) { item in
                    HStack{
                        Text(item.name.wrappedValue)
                        Spacer()

                        Text("$\(item.price.wrappedValue, specifier: "%.2f")")
                    }
                    .swipeActions {
                        Button(role: .destructive, action: { $shopItemModel.cart.items.wrappedValue.removeAll(where: {$0.id == item.id}) }) {
                            Label("Remove item", systemImage: "trash")
                        }
                    }
                }
            }

            Divider()
            Text("Order total: $\(total, specifier: "%.2f")")
            ApplePayButton(action: {
                var products: [Products] = []
                
                for item in shopItemModel.cart.items {
                    let product = Products(name: item.name, amount: NSDecimalNumber(value: item.price))
                    products.append(product)
                }
                payHandler.startPayment(products: products, total: NSDecimalNumber(value: total) ) { success in
                    products = []
                    shopItemModel.cart.items.removeAll()
                }
                
            })
        }
        .onAppear {
            for item in shopItemModel.cart.items {
                total +=  item.price
            }
        }

    }
}
