//
//  DeleteUserFeed.swift
//  CatstaGram
//
//  Created by κΉλν on 2023/01/06.
//

import Foundation

struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
