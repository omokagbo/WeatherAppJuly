import Foundation

public struct OpenWeatherResponse: Codable {
    public let lat: Double?
    public let lon: Double?
    public let current: CurrentWeather?
    public let daily: [DailyWeather]?
}

public struct CurrentWeather: Codable {
    public let dt: Int?
    public let temp: Double?
    public let clouds: Int?
    public let wind_speed: Double?
    public let weather: [Weather]?
}

public struct Weather: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}

public struct DailyWeather: Codable {
    public let dt: Int?
    public let temp: DailyWeatherTemp?
    public let wind_speed: Double?
    public let weather: [DailyWeatherDescription]?
    public let clouds: Int?
}

public struct DailyWeatherTemp: Codable {
    public let day: Double?
    public let min: Double?
    public let max: Double?
    public let night: Double?
    public let eve: Double?
    public let morn: Double?
}

public struct DailyWeatherDescription: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}
