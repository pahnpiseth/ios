//
//  JSONValue.swift
//  ios
//
//  Copyright © 2018 Tinode. All rights reserved.
//

import Foundation

// Needed for encoding/decoding arrays and dictionaries of objects in JSON.
// Inspired by https://medium.com/grand-parade/parsing-fields-in-codable-structs-that-can-be-of-any-json-type-e0283d5edb
public enum JSONValue: Codable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let v):
            try container.encode(v)
            break
        case .int(let v):
            try container.encode(v)
            break
        case .string(let v):
            try container.encode(v)
            break
        case .double(let v):
            try container.encode(v)
            break
        case .dict(let v):
            try container.encode(v)
            break
        case .array(let v):
            try container.encode(v)
            break
        }
    }
    
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case dict([String: JSONValue])
    case array([JSONValue])
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(Int.self) {
            self = .int(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .dict(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .array(value)
        } else {
            throw DecodingError.typeMismatch(JSONValue.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "Not a JSON"))
        }
    }
}
