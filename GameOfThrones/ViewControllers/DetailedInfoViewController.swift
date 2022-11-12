//
//  DetailedInfoViewController.swift
//  GameOfThrones
//
//  Created by Anton Boev on 12.11.2022.
//

import UIKit

class DetailedInfoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var familyLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var character: Character!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        nameLabel.text = character.firstName
        lastNameLabel.text = character.lastName
        fullNameLabel.text = character.fullName
        titleLabel.text = character.title
        familyLabel.text = character.family
        
        fetchImage()
        

    }
    
    private func fetchImage() {
        NetworkManager.shared.fetchData(from: character.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageView?.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}

