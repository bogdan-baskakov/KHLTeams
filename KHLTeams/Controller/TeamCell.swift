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
        
        teamName.text = team.team.name ?? "Команда не найдена"
        teamDivision.text = team.team.division ?? "Дивизион не найден"
        teamLocation.text = team.team.location ?? "Локация не найдена"
        teamConference.text = team.team.conference ?? "Конференция не найдена"
        
        DispatchQueue.global().async {
            
            guard let image = team.team.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.teamImage.image = UIImage(data: imageData)
            }
        }
    }
}
