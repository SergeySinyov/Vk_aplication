//
//  LoginViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 23.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func validateUser() {
        let name = userName.text!
        let password = password.text!
        if name == "user", password == "123" {
            print("Welcom")
        } else {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
