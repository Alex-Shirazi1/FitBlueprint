//
//  HomeEventHandler.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/18/23.
//

import Foundation

protocol HomeEventHandlerProtocol: AnyObject {
    var viewController: HomeViewControllerProtocol? { get set }
}

class HomeEventHandler: HomeEventHandlerProtocol {
    weak var viewController: HomeViewControllerProtocol?
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol
    
    init(interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
