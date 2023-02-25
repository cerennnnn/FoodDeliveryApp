//
//  DetailsInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation
import Alamofire

class DetailsInteractor: PresenterToInteractorFoodDetailsProtocol {
    func addToCard(foodName: String, foodImageName: String, foodPrice: String, foodOrderAmount: String, userName: String) {
        
        let params = ["yemek_adi": foodName, "yemek_resim_adi": foodImageName, "yemek_fiyat": foodPrice, "yemek_siparis_adet": foodOrderAmount, "kullanici_adi": userName] as [String: Any]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
  
    
}
