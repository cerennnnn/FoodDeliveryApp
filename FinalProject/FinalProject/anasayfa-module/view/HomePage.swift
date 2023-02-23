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
        navigationController?.navigationBar.tintColor = UIColor(named: "registerButtonForegroundColor")
        title = K.title
    
        let design = UICollectionViewFlowLayout()
        design.scrollDirection = .vertical
        design.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        
        collectionView.backgroundColor = UIColor(named: K.Colors.backgroundColor)
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 45) / 2 
        
        design.itemSize = CGSize(width: itemWidth * 1, height: itemWidth * 1)
        
        collectionView.collectionViewLayout = design
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: K.Colors.backgroundColor)
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: K.Colors.backgroundColor)!, .font: UIFont(name: K.Font.font, size: 18)!]
        
        HomePageRouter.createModule(ref: self)
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
        let alert = UIAlertController(title: "Dikkat", message: "Çıkış yapmak istiyor musun ?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Evet", style: .default) { action in
            do {
                try firebaseAuth.signOut()
                self.navigationController?.popToRootViewController(animated: true)
            } catch {
                print(error.localizedDescription)
            }
        }
        let noAction = UIAlertAction(title: "Hayır", style: .cancel )
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true)
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

        cell.foodImage.kf.indicatorType = .activity
        cell.foodName.text = food.yemek_adi
        cell.foodImage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foods[indexPath.row]
        
        performSegue(withIdentifier: K.detailSegue, sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
