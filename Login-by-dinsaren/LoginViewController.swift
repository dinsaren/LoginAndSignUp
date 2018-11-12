//
//  LoginViewController.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/9/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UserSignUpDelegate{
    @IBOutlet weak var fieldUsername: UITextField!
    @IBOutlet weak var fieldPassword: UITextField!
    @IBOutlet weak var labelMeassageLogin: UILabel!
    
    
    var userLoginDelegate : UserLoginDelegate!
    var signUpViewController : SignUpViewController!
    
    func storeUserSignUp(name: String, pass: String) {
        if name == "" && pass == ""{
            print("No Data delegate")
        }else{
            UserModel.userList.append(UserModel(name: name, password: pass)) 
            fieldUsername.text = String(name)
            fieldPassword.text = String(pass)
        }
       
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fieldUsername.becomeFirstResponder()
        fieldUsername.delegate = self
        fieldPassword.delegate = self
       
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonSignUp(_ sender: Any) {
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        signUpViewController.userSignUpDelegate=self
        show(signUpViewController, sender: nil)
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        if fieldUsername.text == "" {
            fieldUsername.becomeFirstResponder()
           labelMeassageLogin.text = "* please enter username"
        }else if fieldPassword.text == ""{
            fieldPassword.becomeFirstResponder()
            labelMeassageLogin.text = "Please enter password"
        } else{
            for i in UserModel.userList{
                if fieldUsername.text  == i.username && fieldPassword.text == i.password {
                    print("Login Success \(i.username) and \(i.password)")
                    userLoginDelegate.displayUserName(name: "\(i.username )")
                    dismiss(animated: true, completion: nil)
                    fieldPassword.text = ""
                    fieldUsername.text = ""
                    break
                }
            }
        }
        
    }
}
extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1: fieldPassword.becomeFirstResponder()
        case 2: fieldPassword.resignFirstResponder()
        default:
            print("Error")
        }
        return true
    }
    
}

