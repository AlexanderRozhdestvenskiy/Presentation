//
//  MissionViewCell.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import UIKit

class MissionTableCell: UITableViewCell {
    
    var missionImage = UIImageView()
    var missionTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(missionImage)
        addSubview(missionTitle)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        missionImage.layer.cornerRadius = 10
        missionImage.clipsToBounds = true
        missionImage.contentMode = .scaleAspectFit
    }
    
    func configureTitleLabel() {
        missionTitle.numberOfLines = 0
        missionTitle.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        missionImage.translatesAutoresizingMaskIntoConstraints = false
        missionImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        missionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        missionImage.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        missionImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        missionImage.widthAnchor.constraint(equalTo: missionImage.heightAnchor).isActive = true
    }
    
    func setTitleConstraints() {
        missionTitle.translatesAutoresizingMaskIntoConstraints = false
        missionTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        missionTitle.leadingAnchor.constraint(equalTo: missionImage.trailingAnchor, constant: 24).isActive = true
        missionTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
