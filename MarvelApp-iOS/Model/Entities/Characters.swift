//
//  Characters.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

// MARK: - Welcome
struct Characters: Codable {
    let code: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [DataResult]
}

// MARK: - Result
struct DataResult: Codable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case id, name
        case thumbnail
    }
}


// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
