//
//  FoodBasketRouter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 15.02.2023.
//

import Foundation

class FoodBasketRouter: PresenterToRouterFoodBasketProtocol {
    static func createModule(ref: FoodTableViewController) {
        let presenter = FoodBasketPresenter()
            
        //View
        ref.foodBasketPresenterObject = presenter
            
        //Presenter
        ref.foodBasketPresenterObject?.foodBasketInteractor = FoodBasketInteractor()
        ref.foodBasketPresenterObject?.foodBasketView = ref
            
        //Interactor
        ref.foodBasketPresenterObject?.foodBasketInteractor?.foodBasketPresenter = presenter
    }
}
