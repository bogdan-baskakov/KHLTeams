//
//  ListOfTeamsTableViewController.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {
    
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    private var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTeamsData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        
        let team = teams[indexPath.row]
        cell.configure(with: team)
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func fetchTeamsData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.teams = try JSONDecoder().decode([Team].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print("Error: ", error)
            }
            }.resume()
    }
    
}