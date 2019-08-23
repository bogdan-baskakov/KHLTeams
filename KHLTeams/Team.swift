//
//  Team.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let team: KHLTeam
}

struct KHLTeam: Decodable {
    
    let name: String
    let conference: String
    let location: String
    let image: String
    let division: String
}
