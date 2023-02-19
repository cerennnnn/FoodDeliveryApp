//
//  FoodBasketInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 15.02.2023.
//

import Foundation
import Alamofire

class FoodBasketInteractor: PresenterToInteractorFoodBasketProtocol {
    var foodBasketPresenter: InteractorToPresenterFoodBasketProtocol?
    
    func loadAllFoods(kullanici_adi: String) {
        //http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php
        let params = ["kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodOrdersResponse.self, from: data)
                    print(cevap.sepet_yemekler)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    func deleteFood(sepet_yemek_id: Int, kullanici_adi: String) {
        //http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php
        
    }
}
    
