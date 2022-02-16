import Foundation
import Alamofire

final class APIManager {
    static let instance = APIManager()

    enum Constants {
        static let baseURL = "https://rest.coinapi.io/v1"
    }
    
    enum EndPoints {
        static let assets = "/assets"
    }
    
    let header: HTTPHeaders = ["X-CoinAPI-Key": "88ADD170-B775-464D-8769-3D6A9F998326", "Accept": "application/json"]
    
    func getAllExnchanges(completion: @escaping (([CoinClientModel]) -> Void)) {
        AF.request(Constants.baseURL + EndPoints.assets, method: .get, parameters: [:], headers: header).responseDecodable(of: [CoinServerModel].self) { response in
            switch response.result {
            case .success(let model):
                let convertedModels = model.map(ModelConverter.instance.convert)
                completion(convertedModels)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private init() {}
}
