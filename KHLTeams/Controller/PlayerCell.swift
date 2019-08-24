//
//  PlayerTableViewCell.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 24/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerNumber: UILabel!
    @IBOutlet var playerTeam: UILabel!
    
    func configure(with player: Player) {
        playerName.text = player.name
        playerNumber.text = "№\(player.shirt_number)"
        playerTeam.text = player.team.name
        
        DispatchQueue.global().async {
            
                guard let imageUrl = URL(string: player.image) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerImage.image = UIImage(data: imageData)
            }
        }
    }
}
