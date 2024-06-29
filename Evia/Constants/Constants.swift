//
//  Constants.swift
//  Evia
//
//  Created by Furkan on 23.06.2024.
//

import Foundation

struct Constants {
    
    public struct HomeAPI {
        
        // MARK: - Base
        public static let baseURL = URL(string: "http://localhost:3000/")!
        public static let apiURL = URL(string: "\(baseURL)user/")!
        
        // MARK: - Get All Devices
        public static let allDevicesURL = URL(string: "\(apiURL)getAll")
        
        // MARK: - Set Device
        public static let setDeviceEndpoint = "setDevice"
        
        public static func getDeviceURL(deviceID: Int) -> URL? {
            return URL(string: "\(apiURL)\(setDeviceEndpoint)/\(deviceID)")
        }
    }
    
    public struct WeatherAPI {
        
        // MARK: - Base
        public static let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=38.348152&lon=38.318418&appid=")!
        public static let apiURL = URL(string: "\(baseURL)9969b5c5fb9ccc57e640225998adc761")!
    }
}
