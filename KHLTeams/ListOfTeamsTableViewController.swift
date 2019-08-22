//
//  ListOfTeamsTableViewController.swift
//  KHLTeams
//
//  Created by Bogdan Baskakov on 22/08/2019.
//  Copyright © 2019 Bogdan Baskakov. All rights reserved.
//

import UIKit

class ListOfTeamsTableViewController: UITableViewController {
    
    
    private let url = "https://khl.api.webcaster.pro/api/khl_mobile/teams_v2.json"
    private let teams: [Team] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("COUNT - \(teams.count)")
        print("ARRAY - \(teams)")
        
        fetchData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamCell
        
        let team = teams[indexPath.row]
        cell.configure(with: team)

        return cell
    }
    
    func fetchData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let teams = try JSONDecoder().decode([Team].self, from: data)
                print("JSON - \(teams)")
            } catch let error {
                print(error)
            }
            }.resume()
    }

}
