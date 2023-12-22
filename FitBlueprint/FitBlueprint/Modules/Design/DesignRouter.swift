//
//  DesignRouter.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/20/23.
//

import Foundation
import UIKit

protocol DesignRouterProtocol: AnyObject {
    static func createModule(navigationController: UINavigationController) -> UIViewController
}

class DesignRouter: DesignRouterProtocol {
    weak var navigationController: UINavigationController?
    
    static func createModule(navigationController: UINavigationController) -> UIViewController {
        let interactor: DesignInteractorProtocol = DesignInteractor()
        let router: DesignRouter = DesignRouter()
        router.navigationController = navigationController
        let eventHandler: DesignEventHandlerProtocol = DesignEventHandler(interactor: interactor, router: router)
        let viewController = DesignViewController(eventHandler: eventHandler)
        eventHandler.viewController = viewController
        return viewController
    }
    
}
