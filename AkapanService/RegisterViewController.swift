//
//  RegisterViewController.swift
//  AkapanService
//
//  Created by TST-APP-02 on 15/1/2562 BE.
//  Copyright © 2562 Akapan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
//    Explicit
    var name: String?
    var user: String?
    var password: String?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // Main Function

    @IBAction func cloudUploadButton(_ sender: Any) {
        
//        Get value from TextFields
        name = nameTextField.text
        user = userTextField.text
        password = passwordTextField.text
        
//        Call show log
        showLog(title: "Name", message: name!)
        showLog(title: "User", message: user!)
        showLog(title: "Password", message: password!)
        
//        Call check space
        checkSpace(name: name!, user: user!, password: password!)
        
    }   // CloudUpload
    
    func myAlert(title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true,completion: nil)
    }
    
    func checkSpace(name: String,user: String, password: String) -> Void {
        
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
//            Have space
            showLog(title: "Result", message: "Have space")
            myAlert(title: "Have space", message: "Please fill all every blank")
        } else {
            //            No space
            showLog(title: "Result", message: "No space")
            uploadToServer(name: name, user: user, password: password)
        }
        
    }
    
    func uploadToServer(name: String, user: String, password: String) -> Void {
        
        let myConstant = MyConstant()
        let urlString: String = "\(myConstant.getUrlAddUser())\(name)&User=\(user)&Password=\(password)"
        
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have error")
            } else {
                
                if let testResult = data {
                    
                    let canReadResult = NSString(data: testResult, encoding: String.Encoding.utf8.rawValue)
                    print("canReadResult ==> \(String(describing: canReadResult))")
                    
                    if canReadResult == "True" {
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "backMain", sender: self)
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.myAlert(title: "Cannot upload", message: "Please try again cannot upload")
                        }
                    }
                    
                }
            
            }// If
            
        }   // End task
        
        task.resume()
        
        
        
        
    }
    
    
    func showLog(title: String, message: String) -> Void {
        print("\(title) = \(message)")
    }
    
}   // Main Class
