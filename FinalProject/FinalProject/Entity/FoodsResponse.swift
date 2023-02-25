//
//  FoodAnswer.swift
//  FinalProject
//
//  Created by Ceren Güneş on 11.02.2023.
//

import Foundation

class FoodsResponse: Codable {
    var foods: [Foods]?
    var success: Int?
    
    enum CodingKeys: String, CodingKey {
        case foods = "yemekler"
    }
}
