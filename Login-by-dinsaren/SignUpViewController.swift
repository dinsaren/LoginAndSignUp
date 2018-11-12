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
        fieldPassword.delegate=self
        fieldUsername.delegate=self
        filedConfirmPassword.delegate=self
        fieldUsername.becomeFirstResponder()
        
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
    @IBAction func buttonExitSignUp(_ sender: Any) {
         dismiss(animated: true, completion: nil)
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

extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:fieldPassword.becomeFirstResponder()
        case 2:filedConfirmPassword.becomeFirstResponder()
        case 3:filedConfirmPassword.resignFirstResponder()
        default:
            print("Error")
        }
        return true
    }
}
