//
//  ViewController.swift
//  FirebaseCoreData
//
//  Created by ALYSSON DODO on 26/12/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        Auth.auth().createUser(withEmail: "almenezes912@gmail.com", password: "a1234567"){
//            authResult, error in
//            if error == nil {
//                print("sucesso cadastro")
//            } else {
//                print("falha em realizar o cadastro, segue o error: \( error?.localizedDescription ?? "")")
//            }
//        }
//    }
        Auth.auth().signIn(withEmail: "almenezes912@gmail.com", password: "a1234567"){
            authResult, error in
            if error == nil {
                print("sucesso cadastro")
            } else {
                print("falha em realizar o cadastro, segue o error: \( error?.localizedDescription ?? "")")
            }
        }
    }

}


