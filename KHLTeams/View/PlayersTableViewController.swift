//
//  PlayersTableViewController.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 24/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class PlayersTableViewController: UITableViewController {
    
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/players_v2_light.json"
    private var players: [Player] = []

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
    
    private func fetchPlayersData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.players = try JSONDecoder().decode([Player].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("Error: ", error)
            }
            }.resume()
    }
}
