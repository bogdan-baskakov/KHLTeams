//
//  TeamsTableViewController.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit
import Alamofire

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
    
    
    private func fetchTeamsData() {
        guard let url = URL(string: url) else { return }
        
        request(url).validate().responseJSON { responseJson in
            
            switch responseJson.result {
            case .success(let value):
                print(value)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }

}
