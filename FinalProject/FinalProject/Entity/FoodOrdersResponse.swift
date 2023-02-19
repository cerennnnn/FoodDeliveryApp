//
//  FoodBasketResponse.swift
//  FinalProject
//
//  Created by Ceren Güneş on 18.02.2023.
//

import Foundation

class FoodOrdersResponse: Codable {
    var sepet_yemekler: [FoodOrders]?
    var success: Int?
}
