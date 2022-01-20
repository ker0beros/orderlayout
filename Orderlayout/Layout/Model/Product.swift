//
//  Product.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct Product: Codable {
    let id: Int
    let variantID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case variantID = "variant_id"
    }
}

enum ActionType: String, Codable {
    case appModelOrderLayoutGroup = "App\\Model\\OrderLayout\\Group"
    case appModelProduct = "App\\Model\\Product"
    case appModelPromotion = "App\\Model\\Promotion"
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

enum AtedAt: String, Codable {
    case the20220119T070812000Z = "2022-01-19T07:08:12.000Z"
    case the20220119T070813000Z = "2022-01-19T07:08:13.000Z"
    case the20220119T070814000Z = "2022-01-19T07:08:14.000Z"
    case the20220119T070815000Z = "2022-01-19T07:08:15.000Z"
    case the20220119T070816000Z = "2022-01-19T07:08:16.000Z"
    case the20220119T070817000Z = "2022-01-19T07:08:17.000Z"
}
