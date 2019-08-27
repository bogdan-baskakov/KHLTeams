//
//  Team.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let team: TeamDetails
    
    init(dictTeam: [String: Any]) {
        team = TeamDetails(dictTeamInfo: (dictTeam["team"] as? [String: Any] ?? [:]))
    }
    
    static func getTeams(from jsonData: Any) -> [Team] {
        guard let jsonData = jsonData as? Array<[String: Any]> else { return [] }
        
        return jsonData.compactMap { Team(dictTeam: $0) }
    }
}

struct TeamDetails: Decodable {
    let name: String?
    let conference: String?
    let location: String?
    let image: String?
    let division: String?
    
    init(dictTeamInfo: [String: Any]) {
        name = dictTeamInfo["name"] as? String
        conference = dictTeamInfo["conference"] as? String
        location = dictTeamInfo["location"] as? String
        image = dictTeamInfo["image"] as? String
        division = dictTeamInfo["division"] as? String
    }
}
