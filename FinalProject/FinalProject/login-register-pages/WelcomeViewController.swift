//
//  WelcomeViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import CLTypingLabel
import Lottie

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeView: UIView!
    @IBOutlet var yumyumLabel: CLTypingLabel!
    @IBOutlet var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yumyumLabel.text = "YUM YUM"
        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
        welcomeView.layer.cornerRadius = UIScreen.main.bounds.width * 0.35
        welcomeView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
