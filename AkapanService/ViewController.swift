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
        
        let urlObject = URL(string: urlString)
        let reuestObject = NSMutableURLRequest(url: urlObject!)
        let task = URLSession.shared.dataTask(with: reuestObject as URLRequest) {data, response, error in
            
            if error != nil {
                print("Have error")
            } else {
                
                if let testResult = data {
                    let canReadAble = NSString(data: testResult, encoding: String.Encoding.utf8.rawValue)
                    print("canReadAble ==> \(String(describing: canReadAble))")
                    DispatchQueue.main.async {
                        self.convertStringtoDictionary(rawString: canReadAble! as String)
                    }
                }
            }
            
        }   // End task
        task.resume()
        
    }
    
    func convertStringtoDictionary(rawString: String) -> Void {
        print("rawSting ==> \(rawString)")
        
        if rawString == "null" {
            myAlert(title: "User false", message: "No \(String(describing: user)) in my system")
        } else {
          
            let json: String = slipWord(rawString: rawString)
            print("json ==> \(json)")
            var myDictionary: NSDictionary?
            
            if let testJson = json.data(using: String.Encoding.utf8) {
                do {
                    
                    myDictionary = try JSONSerialization.jsonObject(with: testJson, options: []) as? [String: AnyObject] as NSDictionary?
                    print("My dictionany ==> \(String(describing: myDictionary))")
                    
                    if let testDictionary = myDictionary {
                        
                        print("testDictionary ==> \(testDictionary)")
                        let truePassword: String = testDictionary["Password"]! as! String
                        if password! == truePassword {
//                            Success Logon
                            performSegue(withIdentifier: "gotoService", sender: self)
                        } else {
                            myAlert(title: "Password false", message: "Plese try again")
                        }
                    }
                    
                } catch let error as NSError {
                    print("Have error: \(error)")
                }
            } // If
            
        }   // If
    }   // Convert
    
    func slipWord(rawString: String) -> String {
        var results = rawString.components(separatedBy: "[")
        var results2 = results[1].components(separatedBy: "]")
        return results2[0]
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

