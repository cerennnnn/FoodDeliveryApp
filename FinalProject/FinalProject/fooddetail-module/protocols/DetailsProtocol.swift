//
//  DetailsProtocol.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

protocol ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol? { get set }
    
    func addToCard(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String)
}

protocol PresenterToInteractorFoodDetailsProtocol {
    func addToCard(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String)
}

protocol InteractorToPresenterFoodDetailsProtocol {
    
}

protocol PresenterToViewFoodDetailsProtocol {
    
}

protocol PresenterToRouterFoodDetailsProtocol {
    static func createModule(ref: DetailsViewController)
}
