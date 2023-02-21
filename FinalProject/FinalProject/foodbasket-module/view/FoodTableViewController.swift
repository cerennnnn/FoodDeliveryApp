//
//  FoodTableViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth

class FoodTableViewController: UIViewController {

    @IBOutlet var foodTable: UITableView!
    
    var foods = [FoodOrders]()
    var foodBasketPresenterObject: ViewToPresenterFoodBasketProtocol?
    var response: FoodOrders?
    
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
        print("self.foods = \(self.foods)")
        print("foodList = \(foodList)")
    }
}

// MARK: - Table view data source
extension FoodTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableCell, for: indexPath) as! FoodsTableViewCell
//        let food = foods[indexPath.row]
        
        if let response = response {
            cell.foodPriceLabel.text = "\(response.yemek_fiyat!)"
            cell.foodNumberLabel.text = "\(response.yemek_siparis_adet!)"
            cell.foodImage.image = UIImage(named: response.yemek_resim_adi!)
            cell.foodNameLabel.text = response.yemek_adi
            
        }
        
//        cell.foodImage.image = UIImage(named: food.yemek_resim_adi!)
//        cell.foodNameLabel.text = food.yemek_adi
//        cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
//        cell.foodNumberLabel.text = "\(food.yemek_siparis_adet!)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let food = self.foods[indexPath.row]
            
            let alert = UIAlertController(title: "Dikkat!", message: "\(food.yemek_adi!) silinsin mi ?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
//                self.anasayfaPresenterNesnesi?.sil(kisi_id: Int(food.sepet_yemek_id!)!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
