//
//  FeedAPIInput.swift
//  CatstaGram
//
//  Created by 김동현 on 2023/01/06.
//

struct FeedAPIInput: Encodable {
    var limit: Int?
    var page: Int?
}
