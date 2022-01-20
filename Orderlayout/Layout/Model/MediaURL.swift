//
//  MediaURL.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct MediaURL: Codable {
    let id: Int
    let collectionName: CollectionName
    let original: String
    let orderColumn: Int
    let s512: String

    enum CodingKeys: String, CodingKey {
        case id
        case collectionName = "collection_name"
        case original
        case orderColumn = "order_column"
        case s512
    }
}
