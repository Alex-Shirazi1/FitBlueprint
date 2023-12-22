//
//  DesignInteractor.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation

protocol DesignInteractorProtocol: AnyObject {
    
}

class DesignInteractor: DesignInteractorProtocol {
    
    let dataManager: DesignDataManagerProtocol
    
    init(dataManager: DesignDataManagerProtocol = DesignDataManager()) {
        self.dataManager = dataManager
    }
}
