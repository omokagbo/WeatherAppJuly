//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by omokagbo on 13/07/2021.
//

import Foundation

class RootViewModel {
    
    typealias DidFetchWeatherCompletion = ((OpenWeatherResponse?, Error?) -> Void)
    
    var didFetchWeatherData: DidFetchWeatherCompletion?
    
    init() {
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        
        guard let url = URL(string: WeatherService.urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            if let error = error {
                self?.didFetchWeatherData?(nil, error)
            } else if let data = data {
               let decoder = JSONDecoder()
                do {
                    let jsonData = try decoder.decode(OpenWeatherResponse.self, from: data)
                    self?.didFetchWeatherData?(jsonData, nil)
                } catch {
                    debugPrint("unable to decode data \(error)")
                    self?.didFetchWeatherData?(nil, error)
                }
            } else {
                self?.didFetchWeatherData?(nil, nil)
            }
        }.resume()
    }
    
}
