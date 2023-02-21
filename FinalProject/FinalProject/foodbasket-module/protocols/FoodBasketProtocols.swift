//
//  FoodBasketProtocols.swift
//  FinalProject
//
//  Created by Ceren Güneş on 15.02.2023.
//

import Foundation

//Main Protocols
protocol ViewToPresenterFoodBasketProtocol {
    var foodBasketInteractor: PresenterToInteractorFoodBasketProtocol? { get set }
    var foodBasketView: PresenterToViewFoodBasketProtocol? { get set }
    
    func loadAllFoods()
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorFoodBasketProtocol {
    var foodBasketPresenter: InteractorToPresenterFoodBasketProtocol? { get set }
    
    func loadAllFoods()
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String)
}

//Carrier Protocols
protocol InteractorToPresenterFoodBasketProtocol {
    func sendFoodToPresenter(foodList: [FoodOrders])
}

protocol PresenterToViewFoodBasketProtocol {
    func sendFoodToView(foodList: [FoodOrders])
}

//Router Protocol
protocol PresenterToRouterFoodBasketProtocol {
    static func createModule(ref: FoodTableViewController)
}
