//
//  FoodBasketInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 15.02.2023.
//

import Foundation
import Alamofire
import FirebaseAuth

class FoodBasketInteractor: PresenterToInteractorFoodBasketProtocol {
    var foodBasketPresenter: InteractorToPresenterFoodBasketProtocol?
    
    func loadAllFoods() {
        //http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php
        let params = ["kullanici_adi": username]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(FoodOrdersResponse.self, from: data)
                    if let list = response.basketFoods {
                        self.foodBasketPresenter?.sendFoodToPresenter(foodList: list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func deleteFood(sepet_yemek_id: String, kullanici_adi: String) {
        //http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php
        let params = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullanici_adi]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodOrdersResponse.self, from: data)
                    self.loadAllFoods()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
    
