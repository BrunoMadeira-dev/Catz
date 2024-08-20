//
//  CatBreedDTO.swift
//  Catz
//
//  Created by Bruno Madeira on 19/08/2024.
//

import Foundation

struct CatBreedDTO: Codable {
    var id: String
    var name: String
    var cfa_url: String??
    var imageURL: String?
    var origin: String
    var temperament: String
    var description: String
    var lifespanRange: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cfa_url
        case imageURL = "imageURL" // Se necessário, mapear o ID da imagem para imageURL
        case origin
        case temperament
        case description
        case lifespanRange = "life_span"
    }

    func toCatBreed() -> CatBreed {
        return CatBreed(id: id,
                        name: name,
                        imageURL: imageURL ?? "",
                        origin: origin,
                        temperament: temperament,
                        catDescription: description,
                        lifespanRange: lifespanRange)
    }
}
