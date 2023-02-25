//
//  FoodBasketResponse.swift
//  FinalProject
//
//  Created by Ceren Güneş on 18.02.2023.
//

import Foundation

class FoodOrdersResponse: Codable {
    var basketFoods: [FoodOrders]?
    var success: Int?
    
    enum CodingKeys: String, CodingKey {
        case basketFoods = "sepet_yemekler"
    }
}
