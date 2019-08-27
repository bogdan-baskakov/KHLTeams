//
//  PlayerCell.swift
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
        playerName.text = player.name ?? "Имя не найдено"
        playerNumber.text = "№\(player.shirtNumber ?? 0)"
        playerTeam.text = player.team.name ?? "Команда не найдена"
        
        DispatchQueue.global().async {
            
            guard let image = player.image else { return }
            guard let imageUrl = URL(string: image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerImage.image = UIImage(data: imageData)
            }
        }
    }
}
