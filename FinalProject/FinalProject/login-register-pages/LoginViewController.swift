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
    
    var message = ""
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.play()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        self.activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) { [self] in
            
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//                  guard let strongSelf = self else { return }
                    if let e = error {
                                let err = e as NSError
                                switch err.code {
                                case AuthErrorCode.wrongPassword.rawValue:
                                    self?.message = "Girilen şifre hatalı!!"
                                case AuthErrorCode.invalidEmail.rawValue:
                                    self?.message = "Girilen e-posta adresi geçersiz!"
                                case AuthErrorCode.missingEmail.rawValue:
                                    self?.message = "E-posta alanı boş!"
                                default:
                                    print("unknown error: \(err.localizedDescription)")
                                }
                        
                        let alert = UIAlertController(title: "Hata", message: self?.message, preferredStyle: .alert)
                        let OKButton = UIAlertAction(title: "Tamam", style: .default)

                        alert.addAction(OKButton)
                        self?.present(alert, animated: true)
                    } else {
                        self?.performSegue(withIdentifier: K.loginSegue, sender: self)
                    }
                }
            }
            self.activityIndicator.stopAnimating()
        }
     
    }
}
