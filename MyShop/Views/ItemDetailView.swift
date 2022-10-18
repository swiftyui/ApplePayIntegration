import SwiftUI

struct ItemDetailView: View {
    @Binding var shopItem: ShopItem
    @EnvironmentObject var shopItemModel: ShopItemModel
    
    var body: some View {
        VStack {
            shopItem.image
                .resizable()
                .frame(width: 220, height: 220)
                .cornerRadius(5)
            Divider()
            Text(shopItem.description)
            Text("Price: $\(shopItem.price, specifier: "%.2f")")
            
            
            Text("Add to Cart")
                .frame(width: 200, height: 15)
                .padding()
                .background(Color(hue: 0.523, saturation: 0.0, brightness: 0.177))
                .foregroundColor(.white)
                .clipShape(Capsule())
                .onTapGesture {
                    shopItemModel.addToCart(shopItem: shopItem)
                }
            
            Spacer()
        }
    }
}
