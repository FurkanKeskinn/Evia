//
//  Devices.swift
//  Evia
//
//  Created by Furkan on 27.06.2024.
//

import Foundation

struct Devices: Codable {
    let id: Int
    let name: String
    var isLocked: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case isLocked = "is_locked"
    }
}
