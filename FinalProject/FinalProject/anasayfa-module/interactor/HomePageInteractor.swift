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
        let params = ["yemek_adi": searchWord]

//        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .post,parameters: params).response { response in
//            if let data = response.data {
//                do {
//                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
//                    if let liste = cevap.yemekler {
//                        self.homepagePresenter?.sendFoodToPresenter(foodList: liste)
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(searchWord)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data!)
                
                if let liste = cevap.yemekler {
                    self.homepagePresenter?.sendFoodToPresenter(foodList: liste)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func deleteFood(yemek_id: String) {
        //
    }
    
}
