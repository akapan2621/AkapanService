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
    
    func checkSpace(name: String,user: String, password: String) -> Void {
        
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
//            Have space
            showLog(title: "Have space", message: "")
        } else {
//            No space
            showLog(title: "No space", message: "")
        }
        
    }
    func showLog(title: String, message: String) -> Void {
        print("\(title) = \(message)")
    }
    
}   // Main Class
