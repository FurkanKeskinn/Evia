//
//  WeatherService.swift
//  Evia
//
//  Created by Furkan on 25.06.2024.
//

import Foundation
import Alamofire

class WeatherService {
    func getWeather(completion: @escaping (Result<Weather, Error>) -> Void) {
        
        AF.request(Constants.WeatherAPI.apiURL, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let weatherResponse = try decoder.decode(Weather.self, from: response.data ?? Data())
                    completion(.success(weatherResponse))
                } catch {
                    print("JSON Decoding Error: \(error)")
                    completion(.failure(error))
                }
            case .failure(let error):
                print("API Request Error: \(error)")
                completion(.failure(error))
            }
            
        }
    }
}
