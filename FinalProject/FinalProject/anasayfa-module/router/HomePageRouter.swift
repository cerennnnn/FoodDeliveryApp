//
//  HomePageRouter.swift
//  FinalProject
//
//  Created by Ceren Güneş on 11.02.2023.
//

import Foundation

class HomePageRouter: PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePage) {
        let presenter = HomePagePresenter()
        
        //View
        ref.homePagePresenterObject = presenter
        
        //Presenter
        ref.homePagePresenterObject?.homepageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homepageView = ref
        
        //Interactor
        ref.homePagePresenterObject?.homepageInteractor?.homepagePresenter = presenter
    }
    
}
