//
//  NetworkManager.swift
//  Harry Potter Characters
//
//  Created by Mac on 02/02/2023.
//  Copyright © 2023 mssvrk. All rights reserved.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()
    let BASE_URL = "https://hp-api.onrender.com/api/characters"
    let session = URLSession.shared
    
    func fetchCharacters(completion: @escaping ([Character]) -> Void) {
        
       
        guard let url = URL(string: BASE_URL) else { return }
       
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, _, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()

                let allCharacters = try decoder.decode([Character].self, from: data)
                completion(allCharacters)

            } catch {
                print("Error Decoding JSON, error: \(String(describing: error))")
                return
            }
        }
        task.resume()
    }
    

    
    func fetchImage(character: Character, completion: @escaping (UIImage) -> Void) {
        
        let imageURL = character.image
        guard let url = URL(string: imageURL) else { return }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error fetching image: \(String(describing: error))")
                return
            }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            completion(image)
            
        }
        task.resume()
    }
    
}
