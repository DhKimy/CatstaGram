//
//  FeedUploadModel.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

struct FeedUploadModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult
    
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
    
}
