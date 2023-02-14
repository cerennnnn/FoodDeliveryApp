//
//  FoodTableViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit

class FoodTableViewController: UIViewController {

    @IBOutlet var foodTable: UITableView!
    
    var foods = [Yemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let f1 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f2 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f3 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f4 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f5 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f6 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f7 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f8 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f9 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//        let f10 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
//
//        foods = [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10]

        foodTable.delegate = self
        foodTable.dataSource = self
    }
}


// MARK: - Table view data source
extension FoodTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.tableCell, for: indexPath) as! FoodsTableViewCell
        let food = foods[indexPath.row]
        
        cell.foodImage.image = UIImage(named: food.yemek_resim_adi!)
        cell.foodNameLabel.text = food.yemek_adi
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
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
