//
//  Page.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct Page: Codable, Identifiable {
    let groupID: Int?
    let updatedAt: String
    let cells: [Cell]
    let id: String
    let pageID: Int
    let name: String
    let sequence, orderLayoutID: Int
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case groupID = "group_id"
        case updatedAt = "updated_at"
        case cells
        case id = "_id"
        case pageID = "id"
        case name, sequence
        case orderLayoutID = "order_layout_id"
        case createdAt = "created_at"
    }
}
