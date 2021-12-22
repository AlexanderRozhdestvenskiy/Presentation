//
//  Model.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import Foundation

struct Mission: Codable {
    let id: Int
    let crew: [CrewRole]
    let description: String
    let launchDate: String?
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
