//
//  FeedDataManager.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ input: FeedAPIInput, _ viewController: HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: input).validate().responseDecodable(of: [FeedModel].self, completionHandler: { response in
            switch response.result {
            case .success(let result):
                print("성공")
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
