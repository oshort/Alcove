//
//  LoginViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createAccount(sender: AnyObject) {
        
        FIRAuth.auth()?.createUserWithEmail(emailTextField.text!, password: passwordTextField.text!, completion: {
            user,error in
            
            if error != nil {
                self.login()
                
            } else {
                print("User Created")
                self.login()
            }
        })
    }
    
     override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "loginSegue" && (emailTextField.text == "") || (passwordTextField.text == "") {
                let emptyAlertViewController = UIAlertController(title: "Login failed", message: "Please enter a valid email and password", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                }
                emptyAlertViewController.addAction(okAction)
                self.presentViewController(emptyAlertViewController, animated: true, completion: nil)
                
                return false
            }
        return true
        }

  
    func login() {
        FIRAuth.auth()?.signInWithEmail(emailTextField.text!, password: passwordTextField.text!, completion: {
            user,error in
            
            if error != nil {
                print("Incorrect")
                
            } else {
                print("Huzzah")
            }
        })
    }
    
    
    
   
}
