import Foundation

struct CoinClientModel: Codable {
    let assetId: String?
    let name: String?
    let typeIsCrypto: Int?
    let priceUsd: Double?
}
