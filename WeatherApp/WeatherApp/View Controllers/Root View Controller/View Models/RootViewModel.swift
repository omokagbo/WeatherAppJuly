//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by omokagbo on 13/07/2021.
//

import Foundation

class RootViewModel {
    
    typealias DidFetchWeatherCompletion = ((Data?, Error?) -> Void)
    
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
                self?.didFetchWeatherData?(data, nil)
            } else {
                self?.didFetchWeatherData?(nil, nil)
            }
        }.resume()
    }
    
}
