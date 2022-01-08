//
//  DeveloperVC.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 08.01.2022.
//

import UIKit

class DeveloperVC: UIViewController {
    
    lazy var myTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(printBarItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addBarItem))
        
        view.addSubview(myTextField)
        
        setTextFieldConstraints()
    }
    
    private func setTextFieldConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        myTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        myTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 8).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    @objc private func printBarItem() {
        print("Go")
    }
    
    @objc private func addBarItem() {
        print("Add")
    }

}
