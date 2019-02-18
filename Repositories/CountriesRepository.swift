//
//  Countries.swift
//  App
//
//  Created by Saoirse on 18/02/2019.
//

import Foundation

struct SimpleCountry: Codable {
    var name: String
    var capital: String
}

typealias SimpleCountries = [SimpleCountry]

struct CountriesRepository {
    
    static func getSimpleCountries() -> [SimpleCountry]? {
        
        let countryRawData = Data(rawCountries().utf8)
        let decoder = JSONDecoder()
        
        do {
           
            return try decoder.decode(SimpleCountries.self, from: countryRawData)
           
        } catch {
            print("\(error)")
        }
        
        return nil
    
    }
    
    
    static func rawCountries() -> String {
        return """
            [
                {
                    "name": "United Kingdom of Great Britain and Northern Ireland",
                    "alpha2Code": "GB",
                    "capital": "London",
                    "region": "Europe",
                    "population": 65110000,
                    "latlng": [
                        54.0,
                        -2.0
                    ],
                    "demonym": "British",
                    "nativeName": "United Kingdom",
                    "flag": "https://restcountries.eu/data/gbr.svg",
                    "regionalBlocs": [
                        {
                            "acronym": "EU",
                            "name": "European Union ??"
                        }
                    ]
                },
                {
                    "name": "Italy",
                    "alpha2Code": "IT",
                    "capital": "Rome",
                    "region": "Europe",
                    "population": 60665551,
                    "latlng": [
                        42.83333333,
                        12.83333333
                    ],
                    "demonym": "Italian",
                    "nativeName": "Italia",
                    "regionalBlocs": [
                        {
                            "acronym": "EU",
                            "name": "European Union"
                        }
                    ],
                },
            ]
"""
    }
}
