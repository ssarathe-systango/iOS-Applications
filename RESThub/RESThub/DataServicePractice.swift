////
////  DataServicePractice.swift
////  RESThub
////
////  Created by macmini01 on 27/07/22.
////
//
//import Foundation
//
////MARK: CREATE CLASS DATASERVICE
//class DataService {
//    static let shared = DataService()
//    fileprivate let baseURLString = "https://api.github.com"
//    
//    //MARK: FETCHGISTS FUNCTION
//    func fetchGists() {
//
//        //MARK: THIS IS THE FIRST WAY TO CREATE URL USING "URL"
//        var baseURL = URL(string: baseURLString)
//        baseURL?.appendPathComponent("/somepath")
//
//
//        //MARK: THIS IS THE SECOND WAY TO CREATE URL USING "URL relativeTo"
//        let compusedURL = URL(string: "/somepath", relativeTo: baseURL)
//
//
//        // MARK: THIS IS THE THIRD WAY TO CREATE URL USING "URLcomponents()"
//        var componentURL = URLComponents()
//        componentURL.scheme = "https"
//        componentURL.host = "api.github.com"
//        componentURL.path = "/somepath"
//
//        print(baseURL!)
//        print(compusedURL?.absoluteString ?? "Relative path url failed...")
//        print(componentURL.url!)
//    }
//}
