//
//  DogAPICalling.swift
//  DogAPICalling
//
//  Created by macmini01 on 28/07/22.
//

import Foundation
import UIKit

class DataService {
    
    static let shared = DataService()
    
    func fetchDogs(searchText: String, completion: @escaping (Result <DogImages, Error>) -> Void) {
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "dog.ceo"
        componentURL.path = searchText == "" ? "/api/breed/hound/images" : "/api/breed/\(searchText.lowercased())/images"
        
//        print(componentURL.url!)
        
        guard let validURL = componentURL.url else {
            print("url creating failed...")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: ", httpResponse.statusCode)
            }
            
            guard let validData = data, error == nil else {
                print("Error...")
                return
            }
            
            do {
                let dogImages = try JSONDecoder().decode(DogImages.self, from: validData)
                completion(.success(dogImages))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
        } .resume()
        
    }
    
    // MARK: FETCHING DOG BREAD LIST
    func fetchDogsBreadList(completion: @escaping (Result <DogBreadList, Error>) -> Void) {
        
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "dog.ceo"
        componentURL.path = "/api/breeds/list/all"
        
//        print(componentURL.url!)
        
        guard let validURL = componentURL.url else {
            print("url creating failed...")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: ", httpResponse.statusCode)
            }
            
            guard let validData = data, error == nil else {
                print("Error...")
                return
            }
            
            do {
                let dogbreads = try JSONDecoder().decode(DogBreadList.self, from: validData)
                completion(.success(dogbreads))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
        } .resume()
    }
}
