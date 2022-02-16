import Foundation

struct ModelConverter {
    static let instance = ModelConverter()
    
    func convert(_ serverModel: CoinServerModel) -> CoinClientModel {
        let assetId = serverModel.asset_id ?? ""
        let typeIsCrypto = serverModel.type_is_crypto ?? 0
        let priceUsd = serverModel.price_usd ?? 0.0
        
        let clientModel = CoinClientModel(assetId: assetId,
                                          name: serverModel.name,
                                          typeIsCrypto: typeIsCrypto,
                                          priceUsd: priceUsd)
        return clientModel
    }
    
    private init() {}
}
