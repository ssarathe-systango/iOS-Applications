//
//  Model.swift
//  DogAPICalling
//
//  Created by macmini01 on 28/07/22.
//

import Foundation

struct DogImages: Codable {
    var message: [String]
}

struct DogBreadList: Codable {
    let message: [String : [String]]?
    let test: String?
}
