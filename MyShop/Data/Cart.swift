import Foundation

struct Cart: Identifiable {
    var id: String
    var items: [ShopItem]
    var total: CGFloat
}
