//
//  FoodTableViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth
import Kingfisher

class FoodTableViewController: UIViewController {

    @IBOutlet var foodTable: UITableView!
    
    var response: FoodOrders?
    var foods = [FoodOrders]()
    var foodBasketPresenterObject: ViewToPresenterFoodBasketProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodTable.delegate = self
        foodTable.dataSource = self
        
        FoodBasketRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        foodBasketPresenterObject?.loadAllFoods()
    }
}

extension FoodTableViewController: PresenterToViewFoodBasketProtocol {
    func sendFoodToView(foodList: [FoodOrders]) {
        self.foods = foodList
        DispatchQueue.main.async {
            self.foodTable.reloadData()
        }
    }
}

// MARK: - Table view data source
extension FoodTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableCell, for: indexPath) as! FoodsTableViewCell
        
        cell.foodImage.kf.setImage(with: URL(string: "\(food.foodImageName!)")!, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        cell.foodNameLabel.text = food.foodName
        cell.foodPriceLabel.text = "\(food.foodPrice!)₺"
        cell.foodNumberLabel.text = "\(food.foodOrderAmount!) adet"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let food = self.foods[indexPath.row]
            
            let alert = UIAlertController(title: "Dikkat!", message: "\(food.foodName!) silinsin mi ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.foodBasketPresenterObject?.deleteFood(sepet_yemek_id: food.basketFoodID!, kullanici_adi: username!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
