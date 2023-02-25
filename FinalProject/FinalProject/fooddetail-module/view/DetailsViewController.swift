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
    var price = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailsRouter.createModule(ref: self)
        
        if let food = food {
            foodImageName = "\(K.url)\(food.foodImageName!)"
            foodImage.kf.indicatorType = .activity
            foodNameLabel.text = food.foodName
            foodPriceLabel.text = "\(food.foodPrice!)₺"
            foodImage.kf.setImage(with: URL(string: "\(K.url)\(food.foodImageName!)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.detailToBasketSegue {
            if let food = sender as? FoodOrders {
                let destinationVC = segue.destination as! FoodTableViewController
                destinationVC.response = food
            }
        }
    }
    
    @IBAction func myBasketButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func addToCardButton(_ sender: UIButton) {
        
//        MARK: - Add Alert to show animation & say item added.
        guard let foodName = food?.foodName else { return }
        let alert = UIAlertController(title: "", message: "\(stepperValue) adet \(foodName) sepete eklendi.", preferredStyle: .alert)
        let OKButton = UIAlertAction(title: "Tamam", style: .default)

        alert.addAction(OKButton)

        self.present(alert, animated: true)
        
        if let foodName = foodNameLabel.text, let foodImageName = foodImageName, let foodPrice = food?.foodPrice, let orderAmount = stepperValueLabel.text, let username = username {
            detailsPresenterObject?.addToCard(foodName: foodName, foodImageName: foodImageName, foodPrice: String(Int(foodPrice)!), foodOrderAmount: String(Int(orderAmount)!), userName: username)
        }
        performSegue(withIdentifier: K.detailToBasketSegue, sender: nil)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        stepperValueLabel.text = "\(Int(sender.value))"
        stepperValue = Int(sender.value)
    }
}
