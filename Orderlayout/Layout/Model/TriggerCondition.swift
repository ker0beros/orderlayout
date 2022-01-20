//
//  TriggerCondition.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct TriggerCondition: Codable {
    let name: String
    let type: CollectionName
    let products: [Product]
    let maxQuantity: JSONNull?
    let minQuantity: Int

    enum CodingKeys: String, CodingKey {
        case name, type, products
        case maxQuantity = "max_quantity"
        case minQuantity = "min_quantity"
    }
}
