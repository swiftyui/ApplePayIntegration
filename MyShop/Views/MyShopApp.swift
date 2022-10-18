import SwiftUI

@main
struct MyShopApp: App {
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining: Int = 4
    @State var isLoading: Bool = true
    @StateObject var shopItemModel: ShopItemModel = ShopItemModel()
    
    var body: some Scene {
        WindowGroup {
            
            if isLoading {
                SplashScreenView().onReceive(timer) {_ in
                    if ( timeRemaining > 0 )
                    {
                        timeRemaining -= 1
                    }
                    if (timeRemaining <= 0)
                    {
                        timer.upstream.connect().cancel()
                        isLoading = false
                    }
                }
            }
            else {
                TabView {
                    ShopView().environmentObject(shopItemModel).tabItem() {
                        Label("My Shop", systemImage: "house")
                    }
                    CartView().environmentObject(shopItemModel).tabItem() {
                        Label("Cart", systemImage: "basket")
                    }.badge(shopItemModel.cart.items.count)
                }
                .tint(.black)
            }
        }
    }
}
