//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by Ceren Güneş on 10.02.2023.
//

import UIKit
import FirebaseAuth
import Lottie

class RegisterViewController: UIViewController {

    @IBOutlet var animationView: LottieAnimationView!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    var message = ""
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.7
        animationView.play()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        self.activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) { [self] in
            if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                                    let err = e as NSError
                                    switch err.code {
                                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                                        self.message = "Bu e-posta adresi zaten kullanılıyor, lütfen başka bir e-posta giriniz."
                                    case AuthErrorCode.invalidEmail.rawValue:
                                        self.message = "Geçersiz e-posta adresi!"
                                    case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                                        self.message = "Bu e-posta çoktan alınmış!"
                                    case AuthErrorCode.weakPassword.rawValue:
                                        self.message = "lütfen daha güçlü bir şifre giriniz!"
                                    default:
                                        self.message = "Bilgileriniz hatalı, lütfen kontrol edip tekrar deneyiniz."
                                        print("unknown error: \(err.localizedDescription)")
                                    }
                            
                            let alert = UIAlertController(title: "Hata!", message: self.message, preferredStyle: .alert)
                            let OKButton = UIAlertAction(title: "Tamam", style: .default)

                            alert.addAction(OKButton)
                            self.present(alert, animated: true)
                        }
                     else {
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
            activityIndicator.stopAnimating()
        }
    }
}
