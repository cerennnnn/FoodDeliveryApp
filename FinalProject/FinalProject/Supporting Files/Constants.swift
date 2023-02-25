//
//  Constant.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import Foundation
import FirebaseAuth

let username = Auth.auth().currentUser?.email

struct K {
    static let registerSegue = "registerToMainSegue"
    static let loginSegue = "loginToMainSegue"
    static let detailSegue = "detailSegue"
    static let detailToBasketSegue = "detailToBasketSegue"
    static let tableCell = "tableCell"
    static let collectionCell = "collectionCell"
    static let title = "Yumyum"
    static let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
    static let username = Auth.auth().currentUser?.email
    
    struct Colors {
        static let backgroundColor = "backgroundColor"
        static let buttonBackgroundColor = "buttonBackgroundColor"
        static let anchorColor = "anchorColor"
        static let cellBackgroundColor = "cellBackgroundColor"
        static let searchBarTintColor = "searchBarTintColor"
        static let navigationBarTint = "navigationBarTint"
        static let viewBackgroundColor = "viewBackgroundColor"
        static let textColor = "textColor"
    }
    
    struct Font {
        static let font = "NotoSansJP-Regular"
    }
}
