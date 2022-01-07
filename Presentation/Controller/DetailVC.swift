//
//  DetailViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 23.12.2021.
//

import UIKit

class DetailVC: UIViewController {
    
    var mission: Mission?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        navigationItem.title = "Detail"
    }
}
