//
//  HomePageInteractor.swift
//  FinalProject
//
//  Created by Ceren Güneş on 11.02.2023.
//

import Foundation
import Alamofire

class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    var homepagePresenter: InteractorToPresenterHomePageProtocol?
    
    func loadAllFoods() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let response = cevap.yemekler  {
                        self.homepagePresenter?.sendFoodToPresenter(foodList: response)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    
    func search(searchWord: String) {
        //
    }
    
    func deleteFood(yemek_id: String) {
        //
    }
    
}
