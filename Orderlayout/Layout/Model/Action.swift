//
//  Action.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct Action: Codable, Hashable {
    let id: Int
    let name: String
    let createdAt, updatedAt: String
    let deletedAt: String?
    let pricebookID: Int?
    let outletID: Int?
    let categoryID: Int?
    let code: String?
    let actionDescription: String?
    let colorCode: String?
    let priceType, status: Int?
    let unitPrice, originalPrice: String?
    let cost: String?
    let chargeable, featured, outOfStock: Bool?
    let availability: [String]?
    let availableFrom, availableTo: String?
    let allowMediaOverride: Bool?
    let maxUnitPrice, rrp: String?
    let restrictPriceOverride, restrictVisibilityOverride: Int?
//    let mediaUrls: [MediaURL]?
    let type: String?
//    let triggerConditions: [TriggerCondition]?
//    let applyActions: [ApplyAction]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case pricebookID = "pricebook_id"
        case outletID = "outlet_id"
        case categoryID = "category_id"
        case code
        case actionDescription = "description"
        case colorCode = "color_code"
        case priceType = "price_type"
        case status
        case unitPrice = "unit_price"
        case originalPrice = "original_price"
        case cost, chargeable, featured
        case outOfStock = "out_of_stock"
        case availability
        case availableFrom = "available_from"
        case availableTo = "available_to"
        case allowMediaOverride = "allow_media_override"
        case maxUnitPrice = "max_unit_price"
        case rrp
        case restrictPriceOverride = "restrict_price_override"
        case restrictVisibilityOverride = "restrict_visibility_override"
//        case mediaUrls = "media_urls"
        case type
//        case triggerConditions = "trigger_conditions"
//        case applyActions = "apply_actions"
    }
}
