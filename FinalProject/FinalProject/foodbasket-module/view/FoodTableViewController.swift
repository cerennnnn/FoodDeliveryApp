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
    @IBOutlet var totalLabel: UILabel!
    
    var response: FoodOrders?
    var foods = [FoodOrders]()
    var foodBasketPresenterObject: ViewToPresenterFoodBasketProtocol?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTable.delegate = self
        foodTable.dataSource = self
        
        FoodBasketRouter.createModule(ref: self)
        totalLabel.text = "0₺"
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func getTotalLabel() {
        var total = 0
        var price = 0
        for food in foods {
            price = Int(food.foodPrice!)! * Int(food.foodOrderAmount!)!
            total += price
            totalLabel.text = "\(total)₺"
        }
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
        cell.foodNumberLabel.text = "(\(food.foodOrderAmount!) adet)"
     
        getTotalLabel()
        
        tableView.separatorColor = UIColor(named: "cellLightModeBackground")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let food = self.foods[indexPath.row]
            if let foodOrderAmount = food.foodOrderAmount {
                let alert = UIAlertController(title: "Dikkat!", message: "\(foodOrderAmount) adet \(food.foodName!) silinsin mi ?", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
                alert.addAction(cancelAction)
                
                let yesAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                    
                    self.foodBasketPresenterObject?.deleteFood(sepet_yemek_id: food.basketFoodID!, kullanici_adi: username!)
                    self.foods.remove(at: indexPath.row)
                    self.foodTable.deleteRows(at: [indexPath], with: .top)
                    self.getTotalLabel()
                    tableView.reloadData()
                    
                    if self.foods.count == 0 {
                        let alert = UIAlertController(title: "Dikkat!", message: "Sepetinizde hiçbir ürün bulunmamaktadır.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Tamam", style: .cancel) {_ in
                            self.dismiss(animated: true)
                        }
                        
                        alert.addAction(action)
                        
                        self.present(alert, animated: true)
                        self.totalLabel.text = "0₺"
                    }
                }
                
                alert.addAction(yesAction)
                self.present(alert, animated: true)
            }
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
