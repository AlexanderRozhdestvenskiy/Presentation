//
//  FirstViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class TableVC: UIViewController {
    
    private lazy var table = UITableView(frame: .zero, style: .grouped)
    private lazy var missions: [Mission] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureTableView()
        loadData()
    }
    
    private func tableViewSetting() {
        table.delegate = self
        table.dataSource = self
    }
    
    private func configureTableView() {
        view.addSubview(table)
        tableViewSetting()
        table.register(MissionTableCell.self, forCellReuseIdentifier: "Cell")
        table.rowHeight = 88
        
        table.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        table.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
    }
    
    private func loadData() {
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

extension TableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MissionTableCell
        let mission = missions[indexPath.row]
        cell.missionImage.image = UIImage(named: mission.image)
        cell.missionTitle.text = mission.displayName
        
        return cell
    }
}

extension TableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mission = missions[indexPath.row]
        let missionDetailViewController = DetailVC()
        missionDetailViewController.mission = mission
        
        self.present(missionDetailViewController, animated: true)
    }
}
