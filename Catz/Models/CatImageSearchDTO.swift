//
//  CatImageSearchDTO.swift
//  Catz
//
//  Created by Bruno Madeira on 20/08/2024.
//

import Foundation

struct CatImageSearchDTO: Codable {
    
    var id: String?
    var url: String?
    var width: Int?
    var height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case width
        case height
    }
}
