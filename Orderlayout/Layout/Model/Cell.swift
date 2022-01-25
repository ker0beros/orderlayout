//
//  Cell.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct Cell: Codable {
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
        case appModelOrderLayoutGroup = "App\\Model\\OrderLayout\\Group"
        case appModelProduct = "App\\Model\\Product"
        case appModelPromotion = "App\\Model\\Promotion"
    }
}
