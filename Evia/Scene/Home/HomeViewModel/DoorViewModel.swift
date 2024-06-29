//
//  DoorViewModel.swift
//  Evia
//
//  Created by Furkan on 23.06.2024.
//

import Foundation

protocol DoorViewModelProtocol {
    var didSuccessDoor: ((Bool) -> ())? {get set}
    func getDoorData(door: Bool)
}

class DoorViewModel: DoorViewModelProtocol {
    
    var reloadData: ((Devices) -> ())?
    private var serviceDoor = HomeService()
    var didSuccessDoor: ((Bool) -> ())?
    
    init() {
        self.serviceDoor = HomeService()
    }
    
    internal func getDoorData(door: Bool) {
        serviceDoor.doorControl(door: door) { result in
            switch result {
            case .success(let doorResponse):
                self.didSuccessDoor?(true)
                
            case .failure:
                self.didSuccessDoor?(false)
            }
        }
    }                         
}
