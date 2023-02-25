//
//  DetailsPresenter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

class DetailsPresenter: ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol?
    
    func addToCard(foodName: String, foodImageName: String, foodPrice: String, foodOrderAmount: String, userName: String) {
        foodDetailsInteractor?.addToCard(foodName: foodName, foodImageName: foodImageName, foodPrice: foodPrice, foodOrderAmount: foodOrderAmount, userName: userName)
    }
}
