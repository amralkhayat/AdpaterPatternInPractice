//
//  GoogleSignInAuthenticator.swift
//  AdpaterPatternInPractice
//
//  Created by Amr Saeed on 03/02/2022.
//

import Foundation
import GoogleSignIn

final class GoogleSignInAuthenticatorAdapter: Authentications {
    
    //MARK: - properities
    
    private let view: UIViewController
    private let clientId = "1044535542633-mupoolprn5uaps1q2kgfnolr256ak2s8.apps.googleusercontent.com"
    private lazy var configuration: GIDConfiguration = {
        return GIDConfiguration(clientID: clientId)
    }()
    
    //MARK: - init
    
    init (view: UIViewController) {
        self.view = view
    }
    
    //MARK: - authentications Methods
    
    func signIn(completion: @escaping (Result<User, Error>) -> Void) {
        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: view) { user, error in
            
            guard let user = user else {
                completion(.failure(error!))
                return
            }
            guard let email = user.profile?.email  else { return }
            let userData = User(email:email, clientId: user.authentication.clientID, accessToken: user.authentication.accessToken)
            completion(.success(userData))
        }
    }
}
