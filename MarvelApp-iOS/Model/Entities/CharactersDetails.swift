//
//  CharactersDetails.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

// MARK: - Welcome
struct CharactersDetails: Codable {
    let code: Int
    let data: DataClassDetails
}

// MARK: - DataClass
struct DataClassDetails: Codable {
    let results: [DataResultsDetails]
}

// MARK: - Result
struct DataResultsDetails: Codable {
    let id: Int
    let name: String
    let thumbnail: ThumbnailsDetails
    let comics: ComicsDetail
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case comics
    }
}


// MARK: - Thumbnail
struct ThumbnailsDetails: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Comics
struct ComicsDetail: Codable {
    let items: [ComicsItems]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - ComicsItems
struct ComicsItems: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
