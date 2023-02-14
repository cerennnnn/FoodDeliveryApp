//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth
import Lottie

class LoginViewController: UIViewController {

    @IBOutlet var animationView: LottieAnimationView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                    let alert = UIAlertController(title: "!!", message: e.localizedDescription, preferredStyle: .alert)
                    let OKButton = UIAlertAction(title: "OK", style: .default)

                    alert.addAction(OKButton)
                    self?.present(alert, animated: true)
                } else {
                    self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
