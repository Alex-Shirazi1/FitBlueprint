//
//  DesignEventHandler.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation

protocol DesignEventHandlerProtocol: AnyObject {
    var viewController: DesignViewControllerProtocol? { get set }
}

class DesignEventHandler: DesignEventHandlerProtocol {
    weak var viewController: DesignViewControllerProtocol?
    let interactor: DesignInteractorProtocol
    let router: DesignRouterProtocol
    
    init(interactor: DesignInteractorProtocol, router: DesignRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
