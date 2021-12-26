//
//  LastViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 25.12.2021.
//

import UIKit

class LastVC: UIViewController {
    
    lazy var cardView: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(cardView)
        view.backgroundColor = .systemBackground
        updateInfo()
        setupConstraints()
    }
    
    private func updateInfo() {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "cdn.pixabay.com"
        components.path = "/photo/2021/08/19/12/53/bremen-6557996_1280.jpg"
        
        guard let url = components.url else { fatalError("Missing URL") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.cardView.imageView.image = image
            }
        }
        task.resume()
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        cardView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        cardView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        cardView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        cardView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
    }


}
