//
//  TeamCell.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamDivision: UILabel!
    @IBOutlet var teamLocation: UILabel!
    @IBOutlet var teamConference: UILabel!
    
    func configure(with team: Team) {
        teamName.text = team.team.name
        teamDivision.text = team.team.division
        teamLocation.text = team.team.location
        teamConference.text = team.team.conference
        
        DispatchQueue.main.async {
            guard let imageUrl = URL(string: team.team.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            self.teamImage.image = UIImage(data: imageData)
        }
    }
}
