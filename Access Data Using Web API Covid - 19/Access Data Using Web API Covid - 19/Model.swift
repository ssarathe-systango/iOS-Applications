//
//  Model.swift
//  Access Data Using Web API Covid - 19
//
//  Created by macmini01 on 04/08/22.
//

import Foundation

struct CountryCases: Codable {
    let Country: String?
    let CountryCode: String?
    let Lat: String?
    let Lon: String?
    let cases: Int?
    let status: String?
    let Date: String?
    let ID: String?
    let Province: String?
    let City: String?
    let CityCode: String?
    let Confirmed: Int?
    let Deaths: Int?
    let Recovered: Int?
    let Active: Int?
}
