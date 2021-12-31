//
//  OrganizationVC.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 29.12.2021.
//

import UIKit
import CoreData

class OrganizationVC: UIViewController {
    
    var table = UITableView(frame: .zero, style: .grouped)
    
    var context: NSManagedObjectContext! {
        didSet {
            table.refreshControl?.endRefreshing()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        table.refreshControl = UIRefreshControl()
        table.refreshControl?.beginRefreshing()
    }

}
