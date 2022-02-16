import Foundation

struct CoinServerModel: Codable {
    let asset_id: String?
    let name: String?
    let type_is_crypto: Int?
    let price_usd: Double?
}
