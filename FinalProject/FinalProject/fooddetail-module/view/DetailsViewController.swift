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
    var food: Foods?
    var detailsPresenterObject: ViewToPresenterFoodDetailsProtocol?
    var stepperValue = 1
    var price = 1
    var priceLabel = 1
    var total = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailsRouter.createModule(ref: self)
        
        if let food = food {
            foodImageName = "\(K.url)\(food.foodImageName!)"
            foodImage.kf.indicatorType = .activity
            foodNameLabel.text = food.foodName
            foodPriceLabel.text = "\(food.foodPrice!)₺"
            foodImage.kf.setImage(with: URL(string: "\(K.url)\(food.foodImageName!)"), placeholder: nil, options: [.transition(.fade(0.5))], progressBlock: nil)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.detailToBasketSegue {
            if let food = sender as? FoodOrders {
                let destinationVC = segue.destination as! FoodTableViewController
                destinationVC.response = food
                destinationVC.total = total
                destinationVC.price = price
            }
        }
    }
    
    @IBAction func myBasketButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func addToCardButton(_ sender: UIButton) {

//        MARK: - Add Alert to show animation & say item added.
        if let foodName = foodNameLabel.text, let foodImageName = foodImageName, let foodPrice = food?.foodPrice, let orderAmount = stepperValueLabel.text, let username = username {
            detailsPresenterObject?.addToCard(foodName: foodName, foodImageName: foodImageName, foodPrice: String(Int(foodPrice)!), foodOrderAmount: String(Int(orderAmount)!), userName: username)

            priceLabel = Int(foodPrice)!
            total = priceLabel * stepperValue
            
            guard let foodName = food?.foodName else { return }
            let alert = UIAlertController(title: "", message: "\(stepperValue) adet \(foodName) sepete eklendi. Toplam : \( total)₺", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "Tamam", style: .default)

            alert.addAction(OKButton)

            self.present(alert, animated: true)
            
        }
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValueLabel.text = "\(Int(sender.value))"
        stepperValue = Int(sender.value)
    }
}
