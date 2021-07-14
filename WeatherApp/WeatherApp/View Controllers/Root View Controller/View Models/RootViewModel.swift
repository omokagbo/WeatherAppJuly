//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by omokagbo on 13/07/2021.
//

import Foundation

class RootViewModel {
    
    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    typealias DidFetchWeatherCompletion = (OpenWeatherResponse?, WeatherDataError?) -> Void
    
    var didFetchWeatherData: DidFetchWeatherCompletion?
    
    init() {
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        
        guard let url = URL(string: WeatherService.urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            if let error = error {
                print(error)
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            } else if let data = data {
               let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(OpenWeatherResponse.self, from: data)
                    self?.didFetchWeatherData?(decodedData, nil)
                } catch {
                    print("unable to decode data \(error)")
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            } else {
                self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
            }
        }.resume()
    }
    
}
