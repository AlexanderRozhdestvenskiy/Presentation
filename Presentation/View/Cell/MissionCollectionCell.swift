//
//  MissionCollectionCell.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 23.12.2021.
//

import UIKit

class MissionCollectionCell: UICollectionViewCell {
    
    var missionImage = UIImageView()
    var missionTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        missionImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        missionImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24).isActive = true
        missionImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        missionImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setTitleConstraints() {
        missionTitle.translatesAutoresizingMaskIntoConstraints = false
        missionTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        missionTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
    
}
