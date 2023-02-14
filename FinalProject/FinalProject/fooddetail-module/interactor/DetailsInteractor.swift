//
//  DetailsInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 14.02.2023.
//

import Foundation
import Alamofire

class DetailsInteractor: PresenterToInteractorFoodDetailsProtocol {
    func update(yemek_id: String, yemek_adi: String, yemek_fiyat: String) {
        let params = ["yemek_id": yemek_id, "yemek_adi": yemek_adi,"yemek_fiyat":yemek_fiyat] as [String : Any]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    print("-------UPDATE--------")
                    print("Başarı : \(cevap.success!)")
                    print("Mesaj  : \(cevap.yemekler!)")
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
