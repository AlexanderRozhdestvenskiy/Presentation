//
//  FirstViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    var table = UITableView()
    var missions: [Mission] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureTableView()
        loadData()
    }
    
    func tableViewSetting() {
        table.delegate = self
        table.dataSource = self
    }
    
    func configureTableView() {
        view.addSubview(table)
        tableViewSetting()
        table.register(MissionCell.self, forCellReuseIdentifier: "Cell")
        table.rowHeight = 88
        table.pin(to: view)
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "missions", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            missions = try JSONDecoder().decode([Mission].self, from: jsonData)
        } catch {
            print("Error")
        }
        
    }
    
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MissionCell
        let mission = missions[indexPath.row]
        cell.set(mission: mission)
        
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    
}
