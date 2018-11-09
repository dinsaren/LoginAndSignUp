//
//  SignUpViewController.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/9/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var userSignUpDelegate: UserSignUpDelegate!
    
    @IBOutlet weak var fieldUsername: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var filedConfirmPassword: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        if fieldUsername.text == ""{
            labelMessage.text = "please enter username"
        }else if fieldPassword.text == ""{
            labelMessage.text = "please enter password"
        }else if fieldUsername.text == "" && fieldPassword.text == ""{
            labelMessage.text = "plases enter username and password"
        } else if fieldPassword.text != filedConfirmPassword.text{
             labelMessage.text = "password and confirm password doesn't match"
        }else{
             labelMessage.text = "Sign Up successfully!"
             userSignUpDelegate.storeUserSignUp(name: "\(fieldUsername.text!)", pass: "\(fieldPassword.text!)")
             dismiss(animated: true, completion: nil)
            
        }
        
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
