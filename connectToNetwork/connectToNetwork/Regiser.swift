//
//  Regiser.swift
//  connectToNetwork
//
//  Created by Roman Lab on 29.11.2018.
//  Copyright © 2018 Roman_Lab. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Regiser: UIViewController {
    
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    var databaseRefer: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passText.isSecureTextEntry = true
        databaseRefer = Database.database().reference().child("users")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func action(_ sender: UIButton) {
        if loginText.text != "" && emailText.text != "" && passText.text != ""{
            
            addUser()
            
            let alert = UIAlertController(title: "Регистрация", message: "Вы зарегестрированы (проверте Firebase!!!)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else{
                let alert = UIAlertController(title: "Ошибка", message: "Заполните поля", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        }
    }
    
    func addUser() {
        
        let key = databaseRefer.childByAutoId().key
        
        let user = ["id": key,"login":loginText.text!,"email":emailText.text!,"password":passText.text!]
        
        databaseRefer.child(key!).setValue(user)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
