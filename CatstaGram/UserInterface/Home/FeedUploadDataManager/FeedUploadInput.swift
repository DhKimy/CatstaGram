//
//  FeedUploadInput.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

struct FeedUploadInput: Encodable {
    var content: String?
    var postImageUrl: [String]?
}
