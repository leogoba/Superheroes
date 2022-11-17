//
//  NetworkManager.swift
//  Superheroes
//
//  Created by leogoba on 17.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case apiLink = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch(from url: String, completion: @escaping(Result<[Superhero], NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let superheroes = try JSONDecoder().decode([Superhero].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(superheroes))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
