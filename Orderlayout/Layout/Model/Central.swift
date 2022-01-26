// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Central
struct Central: Codable {
    let updatedAt, id: String
    let centralID, outletID: Int
    let name: String
    let status: Int
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case id = "_id"
        case centralID = "id"
        case outletID = "outlet_id"
        case name, status
        case createdAt = "created_at"
    }
}

enum CollectionName: String, Codable {
    case page = "page"
    case product = "product"
}
