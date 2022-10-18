import SwiftUI

struct ShopItemView: View {
    @Binding var shopItem: ShopItem
    @EnvironmentObject var shopItemModel: ShopItemModel
    
    var body: some View {
        
        NavigationLink(destination: ItemDetailView(shopItem: $shopItem).environmentObject(shopItemModel)) {
            GroupBox {
                VStack {
                    shopItem.image
                        .resizable()
                        .cornerRadius(5)
                    Text(shopItem.name).font(.custom("Futura-Medium", size: 22))
                    Text("$\(shopItem.price, specifier: "%.2f")")
                }
            }
            .groupBoxStyle(ColoredGroupBox(color: .white))
            .shadow(radius: 5)
        }
    }
}

