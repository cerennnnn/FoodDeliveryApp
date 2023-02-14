//
//  DetailsProtocol.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation

protocol PresenterToInteractorFoodDetailsProtocol {
    func update(yemek_id: String, yemek_adi: String, yemek_fiyat :String)
}

protocol ViewToPresenterFoodDetailsProtocol {
    var foodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol? { get set }
    
    func update(yemek_id: String, yemek_adi: String, yemek_fiyat: String)
}

protocol PresenterToRouterFoodDetailsProtocol {
    static func createModule(ref: DetailsViewController)
}
