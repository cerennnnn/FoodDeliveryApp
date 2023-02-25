//
//  DetailsProtocol.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

protocol ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol? { get set }
    
    func addToCard(foodName: String, foodImageName: String, foodPrice: String, foodOrderAmount: String, userName: String)
}

protocol PresenterToInteractorFoodDetailsProtocol {
    func addToCard(foodName: String, foodImageName: String, foodPrice: String, foodOrderAmount: String, userName: String)
}

protocol InteractorToPresenterFoodDetailsProtocol {
    
}

protocol PresenterToViewFoodDetailsProtocol {
    
}

protocol PresenterToRouterFoodDetailsProtocol {
    static func createModule(ref: DetailsViewController)
}
