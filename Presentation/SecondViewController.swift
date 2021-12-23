//
//  SecondViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    private lazy var collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var missions: [Mission] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        collection.delegate = self
        collection.dataSource = self
        
        configureCollectionView()
        loadData()
    }
    
    private func configureCollectionView() {
        view.addSubview(collection)
        collection.register(MissionCollectionCell.self, forCellWithReuseIdentifier: "ColCell")
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCell", for: indexPath) as! MissionCollectionCell
        let mission = missions[indexPath.row]
        cell.missionImage.image = UIImage(named: mission.image)
        cell.missionTitle.text = mission.displayName
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 24
        return cell
    }
}

extension SecondViewController: UICollectionViewDelegate {
    
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 222)
    }
}
