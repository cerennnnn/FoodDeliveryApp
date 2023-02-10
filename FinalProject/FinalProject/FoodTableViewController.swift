//
//  FoodTableViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit

class FoodTableViewController: UIViewController {

    @IBOutlet var foodTable: UITableView!
    
    var foods = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f1 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f2 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f3 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f4 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f5 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f6 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f7 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f8 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f9 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f10 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        
        foods = [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10]

        foodTable.delegate = self
        foodTable.dataSource = self
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
     */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

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
}
