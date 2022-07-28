//
//  DataService.swift
//  RESThub
//
//  Created by macmini01 on 27/07/22.
//

import Foundation

//MARK: CREATE CLASS DATASERVICE
class DataService {
    
    static let shared = DataService()
    fileprivate let baseURLString = "https://api.github.com"

    //MARK: FETCHGISTS() FUNCTION
    func fetchGists(completion: @escaping (Result <[Gist], Error>) -> Void) {
        
        
        // MARK: THIS IS WAY FOR CREATE URL USING "URLcomponents()"
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
        guard let validURl = componentURL.url else {
            print("URL creating failed!!!")
            return
        }
        
        //MARK: URL Session class, shared object and dataTask
        URLSession.shared.dataTask(with: validURl) { data, response, error in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode)")
            }
            
            //guard let work on the And operation. (Both condition should be true)
            guard let validData = data, error == nil else {
//                print("API Error: \(error!.localizedDescription)")
                completion(.failure(error!))
                return
            }
            
            //MARK: serialization of data in json format.
            do {
//                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                let gists = try JSONDecoder().decode([Gist].self, from: validData)
                completion(.success(gists))
            } catch let serializationError {
//                print(serializationError.localizedDescription)
                completion(.failure(serializationError))
            }
            
        }.resume() // for resuming suspended state of tasks.
        
    }
}





