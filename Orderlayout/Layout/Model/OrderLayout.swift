//
//  Order.swift
//  Orderlayout
//
//  Created by Farah Syahirah Abdul Rahim on 20/01/2022.
//

import Foundation

struct OrderLayout: Codable {
    let description, updatedAt, id: String
    let orderID: Int
    let name: String
    let outletID, width, height: Int
    let createdAt: String
    let centrals: [Central]
    let pages: [Page]
    let v: Int

    enum CodingKeys: String, CodingKey {
        case description = "description"
        case updatedAt = "updated_at"
        case id = "_id"
        case orderID = "id"
        case name
        case outletID = "outlet_id"
        case width, height
        case createdAt = "created_at"
        case centrals, pages
        case v = "__v"
    }
}
