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
    
    var foodList: [Foods] = []
    var searchedItems: [Foods] = []
    var searchedWord: String = ""
    
    func loadAllFoods() {
        homepageInteractor?.loadAllFoods()
    }
    
    func search(searchWord: String) {
        searchedWord = searchWord
        searchedItems = foodList.filter({ $0.foodName?.lowercased().contains(searchWord.lowercased()) ?? false })
        homepageView?.sendFoodToView(foodList: foodList)
        homepageInteractor?.search(searchWord: searchedWord)
    }
    
    func getFoodList() -> Int {
        return workingArray().count
    }
    
    func getSearch(for indexPath: IndexPath) -> Foods {
        return workingArray()[indexPath.row]
    }
    
    func workingArray() -> [Foods] {
        if searchedWord.count == 0 {
            return foodList
        } else {
            return searchedItems
        }
    }
    
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol {
    func sendFoodToPresenter(foodList: [Foods]) {
        self.foodList = foodList
        homepageView?.sendFoodToView(foodList: workingArray())
    }
}
