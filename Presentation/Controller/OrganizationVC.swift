//
//  OrganizationVC.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 29.12.2021.
//

import UIKit

class OrganizationVC: UIViewController {
    
    // MARK: - Properties
    
    private let companies = ["Apple", "Google", "Amazon", "Tesla", "Netflix", "Ozon", "Microsoft", "Meta", "Coca-Cola", "BMW"]
    private let commands = ["Ferrari", "McLaren", "Alpine", "Mercedes"]
    
    // MARK: - UI
    
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
    
    lazy var myButtonNav: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Navigation", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(navigation), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        return button
    }()
    
    lazy var mySlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .systemGreen
        slider.maximumTrackTintColor = .systemPink
        slider.thumbTintColor = .systemOrange
        slider.minimumValue = 0
        slider.maximumValue = 1000
        slider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
        return slider
    }()
    
    lazy var mySegment: UISegmentedControl = {
        let segment = UISegmentedControl(items: commands)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentTintColor = .systemRed
        segment.addTarget(self, action: #selector(segmentValue), for: .valueChanged)
        return segment
    }()
    
    // MARK: - Lifecicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        myPicker.dataSource = self
        myPicker.delegate = self
        
        view.addSubview(myLabel)
        view.addSubview(myButton)
        view.addSubview(mySwitch)
        view.addSubview(myPicker)
        view.addSubview(myButtonNav)
        view.addSubview(mySlider)
        view.addSubview(mySegment)
        
        setButtonConstreints()
        setLabelConstraints()
        setSwitchConstreints()
        setPickerConstraints()
        setButtonNavConstreints()
        setSliderConstraints()
        setSegmentConstraints()
    }
    
    // MARK: - Constreints
    
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
        myPicker.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 64).isActive = true
        myPicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -64).isActive = true
        myPicker.heightAnchor.constraint(equalToConstant: 128).isActive = true
    }
    
    private func setButtonNavConstreints() {
        let safeArea = view.safeAreaLayoutGuide
        
        myButtonNav.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 100).isActive = true
        myButtonNav.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -100).isActive = true
        myButtonNav.topAnchor.constraint(equalTo: myPicker.bottomAnchor, constant: 16).isActive = true
        myButtonNav.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setSliderConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        mySlider.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        mySlider.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        mySlider.topAnchor.constraint(equalTo: myButtonNav.bottomAnchor, constant: 16).isActive = true
    }
    
    private func setSegmentConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        mySegment.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8).isActive = true
        mySegment.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8).isActive = true
        mySegment.topAnchor.constraint(equalTo: mySlider.bottomAnchor, constant: 16).isActive = true
        mySegment.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    // MARK: - Methods
    
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
    
    @objc private func navigation() {
        if let navigationController = navigationController {
            let viewController = DetailVC()
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    @objc private func changeValueSlider() {
        print(Int(mySlider.value))
    }
    
    @objc private func segmentValue(target: UISegmentedControl) {
        if target == mySegment {
            let segmentIndex = target.selectedSegmentIndex
            
            myLabel.text = commands[segmentIndex]
        }
    }
}

    // MARK: - PickerExtension

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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.myLabel.text = companies[row]
    }
}
