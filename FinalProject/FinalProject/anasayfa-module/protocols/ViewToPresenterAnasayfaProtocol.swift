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
    func deleteFood(yemek_id: String)
}

protocol PresenterToInteractorHomePageProtocol {
    var homepagePresenter: InteractorToPresenterHomePageProtocol? { get set }
    
    func loadAllFoods()
    func search(searchWord: String)
    func deleteFood(yemek_id: String)
}

protocol InteractorToPresenterHomePageProtocol {
    func sendFoodToPresenter(foodList: [Yemekler])
}

protocol PresenterToViewHomePageProtocol {
    func sendFoodToView(foodList: [Yemekler])
}

protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePage)
}
