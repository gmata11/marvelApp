//
//  CharactersDetailsRequest.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

struct CharactersDetailsRequest: Encodable {
    
    let apikey: String
    let hash: String
    let ts: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case apikey
        case hash
        case ts
    }
}
