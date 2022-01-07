//
//  OrganizationVC.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 29.12.2021.
//

import UIKit

class OrganizationVC: UIViewController {
    
    private let companies = ["Apple", "Google", "Amazon", "Tesla", "Netflix", "Ozon"]
    
    lazy var myLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Yes! or No!"
        label.font = .systemFont(ofSize: 32)
        label.backgroundColor = .orange
        label.layer.cornerRadius = 24
        label.layer.masksToBounds = true
        label.layer.borderWidth = 4
        label.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Alert", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(printButton), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        return button
    }()
    
    lazy var mySwitch: UISwitch = {
        let switchs = UISwitch()
        switchs.translatesAutoresizingMaskIntoConstraints = false
        switchs.addTarget(self, action: #selector(printSwitch), for: .valueChanged)
        switchs.onTintColor = .systemGreen
        switchs.thumbTintColor = .black
        switchs.tintColor = .white
        return switchs
    }()
    
    lazy var myPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .systemGray6
        picker.layer.cornerRadius = 8
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        myPicker.dataSource = self
        myPicker.delegate = self
        
        view.addSubview(myLabel)
        view.addSubview(myButton)
        view.addSubview(mySwitch)
        view.addSubview(myPicker)
        
        setButtonConstreints()
        setLabelConstraints()
        setSwitchConstreints()
        setPickerConstraints()

    }
    
    private func setButtonConstreints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 100).isActive = true
        myButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -100).isActive = true
        myButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 16).isActive = true
        myButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setLabelConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 64).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -64).isActive = true
        myLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 64).isActive = true
    }
    
    private func setSwitchConstreints() {
        let safeArea = view.safeAreaLayoutGuide
        
        mySwitch.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        mySwitch.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 16).isActive = true
    }
    
    private func setPickerConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myPicker.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        myPicker.topAnchor.constraint(equalTo: mySwitch.bottomAnchor, constant: 16).isActive = true
        myPicker.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        myPicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
    }
    
    @objc private func printButton() {
        let alertControl = UIAlertController(title: "Write", message: "Alert presentation\nnew string example", preferredStyle: .alert)
        
        let actionCansel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel")
        }
        
        let actionOk = UIAlertAction(title: "OK", style: .default) { action in
            self.myLabel.text = alertControl.textFields?.first?.text
        }
        
        let actionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { action in
            print("Destructive")
        }
        
        alertControl.addAction(actionCansel)
        alertControl.addAction(actionOk)
        alertControl.addAction(actionDestructive)
        alertControl.addTextField(configurationHandler: nil)
        
        self.present(alertControl, animated: true, completion: nil)
    }
    
    @objc private func printSwitch() {
        view.backgroundColor = mySwitch.isOn ? .systemYellow : .systemBlue
    }
}

extension OrganizationVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companies.count
    }
}

extension OrganizationVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companies[row]
    }
}
