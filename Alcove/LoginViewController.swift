//
//  LoginViewController.swift
//  Alcove
//
//  Created by Oliver Short on 6/13/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  loginButton.titleLabel?.font = UIFont.boldSystemFontOfSize(15)

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if user != nil {
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// Check to see if what is entered into the emailTextField is a valid email address
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(emailTextField.text)
    }
    
// Create an account if one does not already exist using Firebase authentication

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
    
//Login to the application via Firebase if the email address is a valid user
  
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
    
// Perform a segue if the login is successful
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "loginSegue" && (emailTextField.text == "") || (passwordTextField.text == "") || isValidEmail() == false {
            let invalidAlertViewController = UIAlertController(title: "Login failed", message: "Please enter a valid email and password", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            }
            invalidAlertViewController.addAction(okAction)
            self.presentViewController(invalidAlertViewController, animated: true, completion: nil)
            
            return false
        }
        return true
    }
}
