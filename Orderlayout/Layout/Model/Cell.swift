//
//  Cell.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

// If actionType = OrderLayout/Group, action_id of cell = group_id of page

struct Cell: Codable, Hashable {
    let color: Color
    let updatedAt: String
    let id: String
    let cellID, x, y, actionID: Int
    let actionType: ActionType
    let pageID: Int
    let createdAt: String
    let action: Action

    enum CodingKeys: String, CodingKey {
        case color
        case updatedAt = "updated_at"
        case id = "_id"
        case cellID = "id"
        case x, y
        case actionID = "action_id"
        case actionType = "action_type"
        case pageID = "page_id"
        case createdAt = "created_at"
        case action
    }
    
    enum ActionType: String, Codable {
        case group = "App\\Model\\OrderLayout\\Group"
        case product = "App\\Model\\Product"
        case promotion = "App\\Model\\Promotion"
    }
    
    static func isGroup(type: Cell.ActionType) -> Bool{
        return type == ActionType.group
    }
    
    static func isProduct(type: Cell.ActionType) -> Bool{
        return type == ActionType.product
    }
    
    static func isPromotion(type: Cell.ActionType) -> Bool{
        return type == ActionType.promotion
    }
}
