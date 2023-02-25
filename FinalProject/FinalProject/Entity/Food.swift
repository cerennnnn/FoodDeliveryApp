//
//  Food.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import Foundation

class Foods: Codable {
    var foodID: String?
    var foodName: String?
    var foodImageName: String?
    var foodPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case foodID = "yemek_id"
        case foodName = "yemek_adi"
        case foodImageName = "yemek_resim_adi"
        case foodPrice = "yemek_fiyat"
    }
    
    init(foodID: String, foodName: String, foodImageName: String, foodPrice: String) {
        self.foodID = foodID
        self.foodName = foodName
        self.foodImageName = foodImageName
        self.foodPrice = foodPrice
    }
}


