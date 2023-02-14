//
//  ViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth
import Alamofire
import Kingfisher

class HomePage: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    
    var foods = [Yemekler]()
    var homePagePresenterObject: ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.hidesBackButton = true
        title = K.title
        
        HomePageRouter.createModule(ref: self)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.loadAllFoods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.detailSegue {
            if let food = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetailsViewController
                gidilecekVC.food = food
            }
        }
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
    
    @IBAction func seeDetailsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.detailSegue, sender: foods)
        //butona basilinca dogru verilerle gonderme yap
    }
    
    
}

extension HomePage: PresenterToViewHomePageProtocol {
    func sendFoodToView(foodList: [Yemekler]) {
        self.foods = foodList
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomePage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePagePresenterObject?.search(searchWord: searchText)
    }
}

extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.collectionCell, for: indexPath) as! CollectionViewCell
        
        let food = foods[indexPath.row]
//        http://kasimadalan.pe.hu/yemekler/resimler/ayran.png
        cell.foodImage.kf.indicatorType = .activity
        cell.foodName.text = food.yemek_adi
        cell.foodPrice.text = "\(food.yemek_fiyat!)₺ "
        cell.foodImage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        
        performSegue(withIdentifier: K.detailSegue, sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
