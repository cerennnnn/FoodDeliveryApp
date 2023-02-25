//
//  FoodBasket.swift
//  FinalProject
//
//  Created by Ceren Güneş on 18.02.2023.
//

import Foundation

class FoodOrders: Codable {
    var basketFoodID: String?
    var foodName: String?
    var foodImageName: String?
    var foodPrice: String?
    var foodOrderAmount: String?
    var username: String?
    
    init(basketFoodID: String, foodName: String, foodImageName: String, foodPrice: String, foodOrderAmount: String, username: String) {
        self.basketFoodID = basketFoodID
        self.foodName = foodName
        self.foodImageName = foodImageName
        self.foodPrice = foodPrice
        self.foodOrderAmount = foodOrderAmount
        self.username = username
    }
    
    enum CodingKeys: String, CodingKey {
        case basketFoodID = "sepet_yemek_id"
        case foodName = "yemek_adi"
        case foodImageName = "yemek_resim_adi"
        case foodPrice = "yemek_fiyat"
        case foodOrderAmount = "yemek_siparis_adet"
        case username = "kullanici_adi"
    }
}
