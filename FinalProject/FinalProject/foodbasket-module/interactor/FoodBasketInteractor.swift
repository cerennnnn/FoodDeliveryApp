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
    let userName = Auth.auth().currentUser?.email
    
    func loadAllFoods() {
        //http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php
        let params = ["kullanici_adi": userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodOrdersResponse.self, from: data)
                    if let list = cevap.sepet_yemekler {
                        self.foodBasketPresenter?.sendFoodToPresenter(foodList: list)
                    }
                    print("yemekler geldi.")
                    print(cevap.sepet_yemekler!.count)
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
                    print("siparis silindi.")
                    self.loadAllFoods()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
    
