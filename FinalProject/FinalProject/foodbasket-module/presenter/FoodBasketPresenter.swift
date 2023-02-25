//
//  FoodBasketPresenter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 15.02.2023.
//

import Foundation
import FirebaseAuth

class FoodBasketPresenter: ViewToPresenterFoodBasketProtocol {
    var foodBasketInteractor: PresenterToInteractorFoodBasketProtocol?
    var foodBasketView: PresenterToViewFoodBasketProtocol?
    
    func loadAllFoods() {
        foodBasketInteractor?.loadAllFoods()
    }
    
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String) {
        foodBasketInteractor?.deleteFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: username!)
    }
}

extension FoodBasketPresenter: InteractorToPresenterFoodBasketProtocol {
    func sendFoodToPresenter(foodList: [FoodOrders]) {
        foodBasketView?.sendFoodToView(foodList: foodList)
    }
}
