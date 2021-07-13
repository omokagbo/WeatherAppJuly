import Foundation

guard let url = Bundle.main.url(forResource: "openweather", withExtension: "json") else {
    fatalError()
}

guard let data = try? Data(contentsOf: url) else {
    fatalError()
}

let decoder = JSONDecoder()

do {
    let response = try? decoder.decode(OpenWeatherResponse.self, from: data)
    print(response)
} catch {
    fatalError()
}
