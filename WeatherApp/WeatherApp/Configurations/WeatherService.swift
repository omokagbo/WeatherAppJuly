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
    
    static let urlWithLocation = "lat=\(Locations.Ososo.lat.rawValue)&lon=\(Locations.Ososo.lon.rawValue)&exclude=hourly"
    
    static var authenticatedUrl: String  {
        return "&appid=\(WeatherService.APIKey.production.rawValue)"
    }
    
    static let urlString = "\(baseUrl)\(urlWithLocation)\(authenticatedUrl)"
    
    enum APIKey: String {
        
        case development    = "a5540ec9bbcd4ac462bd10c042ef79aa"
        case production     = "e2928625c6a121dd7f8cb964c69b9448"
    }
    
    enum Locations {
        
        enum Ososo: Double {
            case lat = 7.416665
            case lon = 6.2666656
        }
    }
    
}
