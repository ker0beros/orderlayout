//
//  Product.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct Product: Codable {
    let id: Int
    let variantID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case variantID = "variant_id"
    }
}

enum Color: String, Codable {
    case a2C4C9 = "#a2c4c9"
    case b6D7A8 = "#b6d7a8"
    case b7B7B7 = "#b7b7b7"
    case d5A6Bd = "#d5a6bd"
    case ea9999 = "#ea9999"
    case f9Cb9C = "#f9cb9c"
    case ffe599 = "#ffe599"
    case the666666 = "#666666"
}
