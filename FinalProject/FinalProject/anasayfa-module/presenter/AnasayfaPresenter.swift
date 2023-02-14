//
//  HomePagePresenter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 11.02.2023.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol {
    var homepageInteractor: PresenterToInteractorHomePageProtocol?
    var homepageView: PresenterToViewHomePageProtocol?
    
    func loadAllFoods() {
        homepageInteractor?.loadAllFoods()
    }
    
    func search(searchWord: String) {
        homepageInteractor?.search(searchWord: searchWord)
    }
    
    func deleteFood(yemek_id: String) {
        homepageInteractor?.deleteFood(yemek_id: yemek_id)
    }
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol {
    func sendFoodToPresenter(foodList: [Yemekler]) {
        homepageView?.sendFoodToView(foodList: foodList)
    }
    
    
}
