
import SwiftUI

struct ShopView: View {
    @State private var gridLayout: [GridItem] = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
    @State private var searchString: String = ""
    @EnvironmentObject var shopItemModel: ShopItemModel
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                
                ScrollView {
                    SearchBar(searchString: $searchString)
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach( $shopItemModel.shopItems.filter { self.searchString.isEmpty ? true : $0.name.wrappedValue.lowercased().contains(searchString.lowercased())}) { item in
                            ShopItemView(shopItem: item ).frame(width: geo.size.width / 2.2, height: 200).environmentObject(shopItemModel)
                        }
                        
                    }.padding(.all, 10)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("My Shop").font(.custom("Futura-Medium", size: 22)).bold()
                }
                
                ToolbarItem {
                    NavigationLink(destination: CartView().environmentObject(shopItemModel))
                    {
                        Image(systemName: "basket")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}
