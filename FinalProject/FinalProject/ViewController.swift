//
//  ViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var foods = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.hidesBackButton = true
        title = K.title
        
        let f1 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f2 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f3 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f4 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        let f5 = Food(yemek_adi: "chicken", yemek_resim_adi: "chicken", yemek_fiyat: Int(7.50))
        
        foods = [f1, f2, f3, f4, f5]
        
        //bosluklar
        let tasarim = UICollectionViewFlowLayout()
        tasarim.scrollDirection = .horizontal
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15) //yanlardaki bosluklar
        tasarim.minimumInteritemSpacing = 15 //kutucuklar arasi bosluk
        tasarim.minimumLineSpacing = 15 //dikeydeki bosluk
        
        collectionView.backgroundColor = UIColor(named: K.Colors.backgroundColor)
        
        let ekranGenislik = UIScreen.main.bounds.width //ekranin tam genisligi
        let itemGenislik = (ekranGenislik - 40) / 1 //herbir item'in genisligi
     

        
        tasarim.itemSize = CGSize(width: itemGenislik * 0.75, height: itemGenislik * 1.05) //kare olsun
        
        collectionView.collectionViewLayout = tasarim
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: K.Colors.backgroundColor)
    
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: K.Colors.backgroundColor)!, .font: UIFont(name: K.Font.font, size: 18)!]

    }

    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
    } catch {
        print(error.localizedDescription)
    }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCell, for: indexPath) as! CollectionViewCell
        
        let food = foods[indexPath.row]
        
        cell.foodImage.image = UIImage(named: food.yemek_resim_adi!)
        cell.foodName.text = food.yemek_resim_adi
        cell.foodPrice.text = "$\(food.yemek_fiyat!)"
        
        return cell
    }
}
