//
//  DetailsViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var foodPriceLabel: UILabel!
    @IBOutlet var foodNameLabel: UILabel!
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var stepperValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myBasketButton(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailToBasketSegue, sender: self)
        
    }
    
    @IBAction func addToCardButton(_ sender: UIButton) {
        //MARK: - Add Alert to show animation & say item added.
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        print(sender.value)
    }
}