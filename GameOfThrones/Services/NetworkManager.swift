//
//  NetworkManager.swift
//  GameOfThrones
//
//  Created by Anton Boev on 12.11.2022.
//

import Foundation
import Alamofire

enum Link: String {
    case gotCharacterURL = "https://thronesapi.com/api/v2/Characters"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacter(from url: String, completion: @escaping(Result<[Character], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let characters = Character.getCharacters(from: value)
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
                
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let imageData):
                    completion(.success(imageData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
