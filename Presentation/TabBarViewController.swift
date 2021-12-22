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
        first.title = "First"
        let second = SecondViewController()
        second.title = "Second"
        
        first.navigationItem.largeTitleDisplayMode = .always
        second.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: first)
        let nav2 = UINavigationController(rootViewController: second)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "person.circle"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
