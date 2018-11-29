//
//  ViewController.swift
//  connectToNetwork
//
//  Created by Roman Lab on 27.11.2018.
//  Copyright © 2018 Roman_Lab. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var segContr: UISegmentedControl!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var passText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // the button action function
    @IBAction func Tap(_ sender: Any) {
        emailText.resignFirstResponder()
        passText.resignFirstResponder()
    }
    
    @IBAction func Action(_ sender: UIButton) {
        if emailText.text != "" && passText.text != ""{
            if segContr.selectedSegmentIndex == 0 {
                Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!) { (user, error) in
                    if user != nil{
                        print("Success")
                        let alert = UIAlertController(title: "Авторизация", message: "Вы авторизированы!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Авторизация", message: "Такого пользователя не существует!", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        if let myError = error?.localizedDescription{
                            print(myError)
                        }
                        else{
                            print("error!")
                        }
                    }
                }
            }
            else{
                Auth.auth().createUser(withEmail: emailText.text!, password: passText.text!) { (user, error) in
                    if user != nil{
                        print("Success")
                        let alert = UIAlertController(title: "Регистрация", message: "Вы зарегестрированы!", preferredStyle: .alert)
                         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    else{
                        if let myError = error?.localizedDescription{
                            print(myError)
                            let alert = UIAlertController(title: "Регистрация", message: myError, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                        else{
                            print("error!")
                        }
                    }
                }
            }
        }
    }
}
