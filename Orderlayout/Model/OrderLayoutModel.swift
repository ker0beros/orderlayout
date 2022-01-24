//
//  OrderLayoutModel.swift
//  Orderlayout
//
//  Created by EIzlan on 24/01/2022.
//
// To parse the JSON, add this file to your project and do:
//
//   let OrderLayout = try? newJSONDecoder().decode(OrderLayout.self, from: jsonData)

import Foundation

// MARK: -
struct OrderLayout: Codable {
    let Description, updatedAt, id: String?
    let ID: Int?
    let name: String?
    let outletID, width, height: Int?
    let createdAt: String?
    let centrals: [Central]?
    let pages: [Page]?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case Description = "description"
        case updatedAt = "updated_at"
        case id = "_id"
        case ID = "id"
        case name
        case outletID = "outlet_id"
        case width, height
        case createdAt = "created_at"
        case centrals, pages
        case v = "__v"
    }
}

// MARK: - Central
struct Central: Codable {
    let updatedAt, id: String?
    let centralID, outletID: Int?
    let name: String?
    let status: Int?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case updatedAt = "updated_at"
        case id = "_id"
        case centralID = "id"
        case outletID = "outlet_id"
        case name, status
        case createdAt = "created_at"
    }
}

// MARK: - Page
struct Page: Codable {
    let groupID: Int?
    let updatedAt: String?
    let cells: [Cell]?
    let id: String?
    let pageID: Int?
    let name: String?
    let sequence, orderLayoutID: Int?
    let createdAt: String?

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

// MARK: - Cell
struct Cell: Codable {
    let color: String?
    let updatedAt: Date?
    let id: String?
    let cellID, x, y, actionID: Int?
    let actionType: ActionType?
    let pageID: Int?
    let createdAt: Date?
    let action: Action?

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
}

// MARK: - Action
struct Action: Codable {
    let id: Int?
    let name: String?
    let createdAt, updatedAt: Date?
    let deletedAt: JSONNull?
    let pricebookID: Int?
    let outletID: JSONNull?
    let categoryID: Int?
    let code: String?
    let actionDescription: String?
    let colorCode: JSONNull?
    let priceType, status: Int?
    let unitPrice, originalPrice: String?
    let cost: String?
    let chargeable, featured, outOfStock: Bool?
    let availability: [JSONAny]?
    let availableFrom, availableTo: JSONNull?
    let allowMediaOverride: Bool?
    let maxUnitPrice, rrp: String?
    let restrictPriceOverride, restrictVisibilityOverride: Int?
    let mediaUrls: [MediaURL]?
    let type: String?
    let triggerConditions: [TriggerCondition]?
    let applyActions: [ApplyAction]?

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
        case mediaUrls = "media_urls"
        case type
        case triggerConditions = "trigger_conditions"
        case applyActions = "apply_actions"
    }
}

// MARK: - ApplyAction
struct ApplyAction: Codable {
    let type: String?
    let price: Double?
}

// MARK: - MediaURL
struct MediaURL: Codable {
    let id: Int?
    let collectionName: CollectionName?
    let original: String?
    let orderColumn: Int?
    let s512: String?

    enum CodingKeys: String, CodingKey {
        case id
        case collectionName = "collection_name"
        case original
        case orderColumn = "order_column"
        case s512
    }
}

enum CollectionName: String, Codable {
    case page = "page"
    case product = "product"
}

// MARK: - TriggerCondition
struct TriggerCondition: Codable {
    let name: String?
    let type: CollectionName?
    let products: [Product]?
    let maxQuantity: JSONNull?
    let minQuantity: Int?

    enum CodingKeys: String, CodingKey {
        case name, type, products
        case maxQuantity = "max_quantity"
        case minQuantity = "min_quantity"
    }
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
