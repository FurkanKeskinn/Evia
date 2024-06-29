//
//  WeatherViewModel.swift
//  Evia
//
//  Created by Furkan on 25.06.2024.
//

import Foundation

protocol WeatherViewModelProtocol {
    var reloadData: ((Weather) -> ())? { get set }
    func getWeatherData()
}


class WeatherViewModel: WeatherViewModelProtocol {
    
    var weather: Weather? {
        didSet {
            guard let weather = weather else { return }
            reloadData?(weather)
        }
    }
    
    var reloadData: ((Weather) -> ())?
    private var serviceWeather: WeatherService
    
    init(serviceWeather: WeatherService = WeatherService()) {
        self.serviceWeather = serviceWeather
    }
    
    func getWeatherData() {
        serviceWeather.getWeather { [weak self] result in
            switch result {
            case .success(let weatherResponse):
                self?.weather = weatherResponse
            case .failure(let error):
                print("Failed to fetch weather data: \(error)")
            }
        }
    }
}
