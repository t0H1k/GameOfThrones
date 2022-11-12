//
//  CharacterCell.swift
//  GameOfThrones
//
//  Created by Anton Boev on 12.11.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var characterFullName: UILabel!
    @IBOutlet var characterImage: UIImageView!
    
    func configure(with character: Character) {
        characterFullName.text = character.fullName
        
        NetworkManager.shared.fetchData(from: character.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.characterImage?.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
