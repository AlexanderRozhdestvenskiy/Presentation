//
//  ViewController.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpControllers()
    }
    
    private func setUpControllers() {
        
        let first = TableVC()
        first.title = "Table"
        
        let second = CollectionVC()
        second.title = "Collection"
        
        let last = LastVC()
        last.title = "Image"
        
        let organization = OrganizationVC()
        organization.title = "Organization"
        
        let developer = DeveloperVC()
        developer.title = "Developer"
        
        first.navigationItem.largeTitleDisplayMode = .always
        second.navigationItem.largeTitleDisplayMode = .always
        last.navigationItem.largeTitleDisplayMode = .always
        organization.navigationItem.largeTitleDisplayMode = .always
        developer.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: first)
        let nav2 = UINavigationController(rootViewController: second)
        let nav3 = UINavigationController(rootViewController: last)
        let nav4 = UINavigationController(rootViewController: organization)
        let nav5 = UINavigationController(rootViewController: developer)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        nav5.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "Table", image: UIImage(systemName: "list.bullet.circle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(systemName: "tablecells"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Image", image: UIImage(systemName: "photo"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Organization", image: UIImage(systemName: "tray.full"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Developer", image: UIImage(systemName: "xmark.bin"), tag: 5)
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
    }
}
