//
//  HomeInteractor.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/18/23.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    
}

class HomeInteractor: HomeInteractorProtocol {
    
    let dataManager: HomeDataManagerProtocol
    
    init(dataManager: HomeDataManagerProtocol = HomeDataManager()) {
        self.dataManager = dataManager
    }
}
