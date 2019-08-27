//
//  Player.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 24/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let shirtNumber: Int?
    let name: String?
    let image: String?
    let team: PlayerTeam
    
    enum CodingKeys: String, CodingKey {
        case shirtNumber = "shirt_number"
        case name = "name"
        case image = "image"
        case team = "team"
    }
}

struct PlayerTeam: Codable {
    let name: String?
}
