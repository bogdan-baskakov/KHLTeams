//
//  Player.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 24/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let shirt_number: Int?
    let name: String?
    let image: String?
    let team: PlayerTeam
}

struct PlayerTeam: Codable {
    let name: String?
}
