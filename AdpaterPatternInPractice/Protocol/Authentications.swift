//
//  Authentications.swift
//  AdpaterPatternInPractice
//
//  Created by Amr Saeed on 03/02/2022.
//

import Foundation

public protocol Authentications {
   func signIn(completion: @escaping (Result<User,Error>) -> Void)
}
