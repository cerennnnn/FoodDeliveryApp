//
//  DetailsPresenter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

class DetailsPresenter: ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol?
    
    func addToCard(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        foodDetailsInteractor?.addToCard(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
  
}
