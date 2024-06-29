//
//  Weather.swift
//  Evia
//
//  Created by Furkan on 25.06.2024.
//

import Foundation

struct Weather: Codable {
    let main: Main
    let name: String
}

struct Main: Codable {
    let temp: Double
}
