//
//  CharactersRequest.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

struct CharactersRequest: Encodable {
    
    let apikey: String
    let hash: String
    let ts: String
    
    enum CodingKeys: String, CodingKey {
        case apikey
        case hash
        case ts
    }
}
