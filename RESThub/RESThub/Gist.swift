//
//  Gist.swift
//  RESThub
//
//  Created by macmini01 on 28/07/22.
//

import Foundation

//MARK: CREATE MODEL TYPE CODABLE
struct Gist: Codable {
    var id: String
    var isPublic: Bool
    
    //we don't have isPublic key in our json API file, but if we want to use keys which is not in our json file we can use by creating enum and confirming the protocol CodingKey.
    enum CodingKeys: String, CodingKey {
        case id, isPublic = "public"
    }
}
