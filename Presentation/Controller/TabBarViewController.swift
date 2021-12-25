//
//  ViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpControllers()
    }
    
    private func setUpControllers() {
        let first = FirstViewController()
        first.title = "Table"
        let second = SecondViewController()
        second.title = "Collection"
        
        first.navigationItem.largeTitleDisplayMode = .always
        second.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: first)
        let nav2 = UINavigationController(rootViewController: second)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "Table", image: UIImage(systemName: "list.bullet.circle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "tablecells"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
