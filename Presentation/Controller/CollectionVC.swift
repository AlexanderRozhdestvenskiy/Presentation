//
//  SecondViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class CollectionVC: UIViewController {
    
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
        let safeArea = view.safeAreaLayoutGuide
        
        collection.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
        collection.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
        collection.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
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

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return missions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCell", for: indexPath) as! MissionCollectionCell
        let mission = missions[indexPath.row]
        cell.missionImage.image = UIImage(named: mission.image)
        cell.missionTitle.text = mission.displayName
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 24
        cell.layer.borderWidth = 2
        cell.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
}

extension CollectionVC: UICollectionViewDelegate {
    
}

extension CollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 220)
    }
}
