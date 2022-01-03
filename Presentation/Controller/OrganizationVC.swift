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
        button.backgroundColor = .blue
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
    }

}
