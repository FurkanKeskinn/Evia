//
//  DeviceControlViewModel.swift
//  Evia
//
//  Created by Furkan on 27.06.2024.
//

import Foundation

protocol DeviceControlViewModelProtocol {
    var device: Devices? {get set}
    func updateDevice(isLocked: Bool)
    var didSuccessUpdateDevice: ((Bool) -> ())? {get set}
}

class DeviceControlViewModel: DeviceControlViewModelProtocol{
    internal var device: Devices?
    private var serviceDeviceUpdate = HomeService()
    internal var didSuccessUpdateDevice: ((Bool) -> ())?
    
    init(device: Devices?) {
        self.serviceDeviceUpdate = HomeService()
        self.device = device
    }
    
    func updateDevice(isLocked: Bool) {
        guard let device = self.device else {return}
        serviceDeviceUpdate.setDevice(id: device.id, isLocked: isLocked) { result in
            switch result {
            case .success:
                self.didSuccessUpdateDevice?(true)
            case .failure:
                self.didSuccessUpdateDevice?(false)
            }
        }
    }
}
