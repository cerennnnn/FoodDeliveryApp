//
//  DetailsViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var stepperValueLabel: UILabel!
    
    var food: Yemekler?
    var detailsPresenterObject: ViewToPresenterFoodDetailsProtocol?
    var stepperValue = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailsRouter.createModule(ref: self)
        
        if let food = food {
            foodImage.kf.indicatorType = .activity
            foodNameLabel.text = food.yemek_adi
            foodPriceLabel.text = "\(food.yemek_fiyat!)₺"
            foodImage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
            
        }
    }
    
    @IBAction func myBasketButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailToBasketSegue, sender: self)
    }
    
    @IBAction func addToCardButton(_ sender: UIButton) {
        
        //MARK: - Add Alert to show animation & say item added.
        guard let yemek_adi = food?.yemek_adi else { return }
        let alert = UIAlertController(title: "", message: "\(stepperValue) adet \(yemek_adi) sepete eklendi.", preferredStyle: .alert)
        let OKButtom = UIAlertAction(title: "Tamam", style: .default)
        
        alert.addAction(OKButtom)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValueLabel.text = "\(Int(sender.value))"
        stepperValue = Int(sender.value)
    }
}
