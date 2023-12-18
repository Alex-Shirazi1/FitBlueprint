//
//  HomeRouter.swift
//  FitBlueprint
//
//  Created by Alex Shirazi on 12/18/23.
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    static func createModule(navigationController: UINavigationController) -> UIViewController
    
    func navigateToFeedback()
    
    func navigateToAbout()
    
    func navigateToTerms()
}

class HomeRouter: HomeRouterProtocol {
    weak var navigationController: UINavigationController?
    
    static func createModule(navigationController: UINavigationController) -> UIViewController {
        let interactor: HomeInteractorProtocol = HomeInteractor()
        let router: HomeRouter = HomeRouter()
        router.navigationController = navigationController
        let eventHandler: HomeEventHandlerProtocol = HomeEventHandler(interactor: interactor, router: router)
        let viewController = HomeViewController(eventHandler: eventHandler)
        eventHandler.viewController = viewController
        return viewController
    }
    
    func navigateToFeedback() {
        //let feedbackModule = FeedbackRouter.createModule()
       // navigationController?.pushViewController(feedbackModule, animated: true)
    }
    func navigateToAbout() {
       // let aboutViewController = AboutViewController()
        //navigationController?.pushViewController(aboutViewController, animated: true)
    }
    func navigateToTerms() {
        //let termsViewController = TermsViewController()
        //navigationController?.pushViewController(termsViewController, animated: true)
    }
}
