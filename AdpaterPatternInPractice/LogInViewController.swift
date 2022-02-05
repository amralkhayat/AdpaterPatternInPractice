//
//  ViewController.swift
//  AdpaterPatternInPractice
//
//  Created by Amr Saeed on 02/02/2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var authService: Authentications?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = GoogleSignInAuthenticatorAdapter(view: self)
    }
    
    @IBAction func SignInWithGoogleBtn(_ sender: UIButton) {
        authService?.signIn { respones  in
            switch respones {
            case let .success(data):
                print(data)
            case let .failure(error):
                print(error)
            }
        }
    }
}







