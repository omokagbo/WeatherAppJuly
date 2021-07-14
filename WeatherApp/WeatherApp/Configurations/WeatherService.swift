//
//  BaseUrl.swift
//  WeatherApp
//
//  Created by omokagbo on 13/07/2021.
//

import Foundation
import CoreLocation

enum WeatherService {
    
    // MARK: - Properties
    
    static let baseUrl = "https://api.openweathermap.org/data/2.5/onecall?"
    
    static let urlWithLocation = "lat=\(Locations.Ososo.lat)&lon=\(Locations.Ososo.lon)&exclude=hourly"
    
    static var authenticatedUrl: String  {
        return "&appid=\(APIKey.production.rawValue)"
    }
    
    static let urlString = "\(baseUrl)\(urlWithLocation)\(authenticatedUrl)"
    
}
