//
//  PlayersTableViewController.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 24/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit
import Alamofire

class PlayersTableViewController: UITableViewController {
    
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/players_v2_light.json"
    private var players: [Player] = []
    var selectedTeam = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPlayersData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.configure(with: player)
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
   private func sortPlayersByTeam() {
        for player in players.enumerated().reversed() {
            if player.element.team?.name != selectedTeam {
                players.remove(at: player.offset)
            }
        }
    }
    
    func fetchPlayersData() {
        guard let url = URL(string: url) else { return }
        
        request(url).validate().responseJSON { dataResponse in
            
            switch dataResponse.result {
            case .success(let value):
                
                self.players = Player.getPlayers(from: value)
                
                self.sortPlayersByTeam()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
