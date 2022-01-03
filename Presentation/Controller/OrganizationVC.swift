//
//  OrganizationVC.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 29.12.2021.
//

import UIKit

class OrganizationVC: UIViewController {
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(printButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(myButton)
        
        setConstraints()

    }
    
    private func setConstraints() {
        myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    @objc private func printButton() {
        print("Tap")
    }
}
