//
//  Model.swift
//  Presentation
//
//  Created by Alexander Rozhdestvenskiy on 22.12.2021.
//

import Foundation

struct Model {
    let firstName: String
    let LastName: String
}

extension Model {
    static var data: [Model] {
        [
            Model(firstName: "a", LastName: "b"),
            Model(firstName: "b", LastName: "f")
        ]
    }
}
