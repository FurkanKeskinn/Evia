//
//  HomeService.swift
//  Evia
//
//  Created by Furkan on 23.06.2024.
//

import Foundation
import Alamofire

class HomeService {
    
    // MARK: - All Devices
    func getAllDevices(completion: @escaping (Result<[Devices], Error>) -> Void) {

        AF.request(Constants.HomeAPI.allDevicesURL!, method: .get).validate().responseDecodable(of: [Devices].self) { response in
                switch response.result {
                case .success(let devices):
                    print("Devices: \(devices)")
                    completion(.success(devices))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    // MARK: - Set Device
    func setDevice(id: Int, isLocked: Bool, completion: @escaping (Result<SetDeviceResponse, Error>) -> Void) {
        let parameters: Parameters = [
            "is_locked": isLocked
        ]
        
        guard let deviceURL = Constants.HomeAPI.getDeviceURL(deviceID: id) else {
            completion(.failure(APIError.failedTogetData))
            print("AF error: Device URL is invalid.")
            return
        }
        
        AF.request(deviceURL, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: SetDeviceResponse.self) { response in
                switch response.result {
                case .success(let setDeviceResponse):
                    completion(.success(setDeviceResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
