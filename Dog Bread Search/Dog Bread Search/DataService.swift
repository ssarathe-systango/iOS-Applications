//
//  DataService.swift
//  Dog Bread Search
//
//  Created by macmini01 on 29/07/22.
//

import Foundation

class DataService {
    
    static let shared = DataService()
    
    func fetchDogs(searchText: String, completion: @escaping (Result <DogImages, Error>) -> Void) {
        
        let url = URL(string: searchText == "" ? "https://dog.ceo/api/breed/hound/images" : "https://dog.ceo/api/breed/\(searchText.lowercased())/images")
        
        print(searchText == "" ? "https://dog.ceo/api/breed/hound/images" : "https://dog.ceo/api/breed/\(searchText.lowercased())/images")
        
        guard let validURL = url else {
            print("Error...")
            return
        }

        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Code: \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let dogImages = try JSONDecoder().decode(DogImages.self, from: validData)
                completion(.success(dogImages))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
        
    }
    

    func getBreadList(completion: @escaping (Result <DogBreads, Error>) -> Void ) {
        
        let url = URL(string: "https://dog.ceo/api/breeds/list/all")
        
        guard let validURL = url else {
            print("Error...")
            return
        }

        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Code: \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let dogBreadList = try JSONDecoder().decode(DogBreads.self, from: validData)
                completion(.success(dogBreadList))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
    }
}
