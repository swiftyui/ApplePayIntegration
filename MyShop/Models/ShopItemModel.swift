import Foundation
import SwiftUI

class ShopItemModel: ObservableObject {
    @Published var shopItems: [ShopItem] = [ShopItem(id: UUID().uuidString,
                                                     name: "Shoe",
                                                     description: "The comfiest shoe ever!",
                                                     price: 12.99,
                                                     image: Image("shoe")),
                                            ShopItem(id: UUID().uuidString,
                                                     name: "Hat",
                                                     description: "The best hat",
                                                     price: 2.46,
                                                     image: Image("hat")),
                                            ShopItem(id: UUID().uuidString,
                                                     name: "Rocket",
                                                     description: "Fly to the moon",
                                                     price: 23.77,
                                                     image: Image("rocket")),
                                            ShopItem(id: UUID().uuidString,
                                                     name: "Guitar",
                                                     description: "The best guitar",
                                                     price: 24.88,
                                                     image: Image("guitar"))]
    @Published var cart: Cart = Cart(id: UUID().uuidString, items: [], total: 0.00)
    
    func addToCart(shopItem: ShopItem) {
        self.cart.items.append(shopItem)
    }
    
    
}
