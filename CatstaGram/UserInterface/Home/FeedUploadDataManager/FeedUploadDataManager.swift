//
//  FeedUploadDataManager.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

import Alamofire

class FeedUploadDataMagager {
    func posts(_ viewController: HomeViewController, _ parameter: FeedUploadInput) {
        AF.request("https://edu-api-ios-test.softsquared.com/posts", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: FeedUploadModel.self, completionHandler: { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    print("성공")
                } else {
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
 
