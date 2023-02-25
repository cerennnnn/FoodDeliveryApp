//
//  ViewToPresenterHomePageProtocol.swift
//  FinalProject
//
//  Created by Ceren Güneş on 11.02.2023.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var homepageInteractor: PresenterToInteractorHomePageProtocol? { get set }
    var homepageView: PresenterToViewHomePageProtocol? { get set }
    
    func loadAllFoods()
    func search(searchWord: String)
}

protocol PresenterToInteractorHomePageProtocol {
    var homepagePresenter: InteractorToPresenterHomePageProtocol? { get set }
    
    func loadAllFoods()
    func search(searchWord: String)
}

protocol InteractorToPresenterHomePageProtocol {
    func sendFoodToPresenter(foodList: [Foods])
}

protocol PresenterToViewHomePageProtocol {
    func sendFoodToView(foodList: [Foods])
}

protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePage)
}
