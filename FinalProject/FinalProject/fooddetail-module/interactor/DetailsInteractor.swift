//
//  DetailsInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation
import Alamofire

class DetailsInteractor: PresenterToInteractorFoodDetailsProtocol {
    func addToCard(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: String, yemek_siparis_adet: String, kullanici_adi: String) {
        let params = ["yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat, "yemek_siparis_adet": yemek_siparis_adet, "kullanici_adi": kullanici_adi] as [String: Any]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    print("Siparis sepete eklendi!")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
  
    
}
