//
//  GOTCharacters.swift
//  GameOfThrones
//
//  Created by Anton Boev on 12.11.2022.
//

import Foundation

struct Character: Codable {
    let firstName: String
    let lastName: String
    let fullName: String
    let title: String
    let family: String
    let image: String
    let imageUrl: String
    
    init(characterData: [String: Any]) {
        firstName = characterData["firstName"] as? String ?? ""
        lastName = characterData["lastName"] as? String ?? ""
        fullName = characterData["fullName"] as? String ?? ""
        title = characterData["title"] as? String ?? ""
        family = characterData["family"] as? String ?? ""
        image = characterData["image"] as? String ?? ""
        imageUrl = characterData["imageUrl"] as? String ?? ""
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let characterData = value as? [[String: Any]] else { return [] }
        return characterData.map { Character(characterData: $0) }
    }
}
