//
//  LoginViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 23.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userNameTextFild: UITextField!
    
    
    //    @IBOutlet weak var userBameTextFild: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    


    // Клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {

        // Размер клавиратуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value (forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets

    }

    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {

        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)

        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func hideKeyboard() {

        self.scrollView?.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))

        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }

    @IBAction func loginButton(_ sender: Any) {

    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        let name = userNameTextFild.text
        let password = passwordTextFild.text

        if name == "user", password == "123" {
            return true
        } else {
            // Создаем контроллер

            let alert = UIAlertController(title: "Ошибка", message: "Введены не верные имя пользователя и пароль",
                                          preferredStyle: .alert)

            // Создаем кнопку для UIAlertController
            let action  = UIAlertAction(title: "Ок", style: .cancel, handler: nil)

            // Добавляем кнопку на UIAlertController
            alert.addAction(action)

            // Показываем UIAlertController
            present(alert, animated: true, completion: nil)

            return false
        }
    }



    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
}
