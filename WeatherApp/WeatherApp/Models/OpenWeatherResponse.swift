//
//  OpenWeatherResponse.swift
//  WeatherApp
//
//  Created by omokagbo on 13/07/2021.
//

import Foundation

struct OpenWeatherResponse: Codable {
    let lat: Double?
    let lon: Double?
    let current: CurrentWeather?
    let daily: [DailyWeather]?
}

struct CurrentWeather: Codable {
    let dt: Int?
    let temp: Double?
    let clouds: Int?
    let wind_speed: Double?
    let weather: [Weather]?
}

struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct DailyWeather: Codable {
    let dt: Int?
    let temp: DailyWeatherTemp?
    let wind_speed: Double?
    let weather: [DailyWeatherDescription]?
    let clouds: Int?
}

struct DailyWeatherTemp: Codable {
    let day: Double?
    let min: Double?
    let max: Double?
    let night: Double?
    let eve: Double?
    let morn: Double?
}

struct DailyWeatherDescription: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}
