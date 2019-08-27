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
    let team: PlayerTeam?
    
    init(dictPlayer: [String: Any]) {
        shirt_number = dictPlayer["shirt_number"] as? Int
        name = dictPlayer["name"] as? String
        image = dictPlayer["image"] as? String
        team = PlayerTeam(dictPlayerTeam: (dictPlayer["team"] as? [String: Any] ?? [:]))
        
    }
    
    static func getPlayers(from jsonData: Any) -> [Player] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
        
        return jsonData.compactMap { Player(dictPlayer: $0) }
    }
}

struct PlayerTeam: Decodable {
    let name: String?
    
    init(dictPlayerTeam: [String: Any]) {
        name = dictPlayerTeam["name"] as? String
    }
}
