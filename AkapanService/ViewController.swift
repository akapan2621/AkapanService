//
//  ViewController.swift
//  AkapanService
//
//  Created by TST-APP-02 on 15/1/2562 BE.
//  Copyright © 2562 Akapan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    
    var user: String?
    var password: String?
    
    

    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }   // Main Function
    
    func checkAuthen(user: String, password: String) -> Void {
        
        var myConstant = MyConstant()
        
        let urlString: String = myConstant.getUrlgetUser(user: user)
        print("urlString ==> \(urlString)")
    }
    
    func myAlert(title: String, message: String) -> Void {
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        present(objAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        user = userTextField.text
        password = passwordTextField.text
        
        if (user!.count == 0) || (password!.count == 0) {
//            Have space
            print("Have space")
            myAlert(title: "Have space", message: "Please fill all blank")
        } else {
//            No space
            print("No space")
            checkAuthen(user: user!, password: password!)
            
        }
        
        
    }
    

}

