//
//  DevicesViewModel.swift
//  Evia
//
//  Created by Furkan on 27.06.2024.
//

import Foundation

protocol DevicesViewModelProtocol {
    var reloadData: (([Devices]) -> ())? {get set}
    func getallDevicesData()
    func updateDeviceStatus(id: Int, isLocked: Bool, completion: @escaping (Result<Void, Error>) -> Void)
}

class DevicesViewModel: DevicesViewModelProtocol {
    private var serviceAllDevices = HomeService()
    internal var reloadData: (([Devices]) -> ())?
    
    init() {
        self.serviceAllDevices = HomeService()
    }
    
    internal func getallDevicesData() {
        serviceAllDevices.getAllDevices { result in
            switch result {
            case .success(let devicesResponse):
                self.reloadData?(devicesResponse)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateDeviceStatus(id: Int, isLocked: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
            serviceAllDevices.setDevice(id: id, isLocked: isLocked) { result in
                switch result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
