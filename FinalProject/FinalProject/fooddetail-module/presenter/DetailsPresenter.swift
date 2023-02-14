//
//  DetailsPresenter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

class DetailsPresenter: ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol?
        
    func update(yemek_id: String, yemek_adi: String, yemek_fiyat: String) {
        foodDetailsInteractor?.update(yemek_id: yemek_id, yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat)
    } 
}
