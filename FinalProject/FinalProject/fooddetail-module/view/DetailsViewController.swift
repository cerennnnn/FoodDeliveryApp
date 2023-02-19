//
//  DetailsViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import Kingfisher
import FirebaseAuth

class DetailsViewController: UIViewController {

    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var stepperValueLabel: UILabel!
    
    var foodImageName: String?
    var food: Yemekler?
    var detailsPresenterObject: ViewToPresenterFoodDetailsProtocol?
    var stepperValue = 1
    let username = Auth.auth().currentUser?.email
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailsRouter.createModule(ref: self)
        
        if let food = food {
            foodImageName = "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"
            
            foodImage.kf.indicatorType = .activity
            foodNameLabel.text = food.yemek_adi
            foodPriceLabel.text = "\(food.yemek_fiyat!)₺"
            foodImage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
            
        }
    }
    
    @IBAction func myBasketButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func addToCardButton(_ sender: UIButton) {
        
//        MARK: - Add Alert to show animation & say item added.
        guard let yemek_adi = food?.yemek_adi else { return }
        let alert = UIAlertController(title: "", message: "\(stepperValue) adet \(yemek_adi) sepete eklendi.", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "Tamam", style: .default)

        alert.addAction(OKButton)

        self.present(alert, animated: true)
        
        if let foodName = foodNameLabel.text, let foodImageName = foodImageName, let foodPrice = food?.yemek_fiyat, let orderAmount = stepperValueLabel.text, let username = Auth.auth().currentUser?.displayName {
                detailsPresenterObject?.addToCard(yemek_adi: foodName, yemek_resim_adi: foodImageName, yemek_fiyat: Int(foodPrice)!, yemek_siparis_adet: Int(orderAmount)!, kullanici_adi: username)
                print("email: \(username)")
        }
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValueLabel.text = "\(Int(sender.value))"
        stepperValue = Int(sender.value)
    }
}
