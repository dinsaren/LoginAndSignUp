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
    @IBOutlet weak var labelMassage: UILabel!
    
    var userLoginDelegate : UserLoginDelegate!
    var signUpViewController : SignUpViewController!
    
    func storeUserSignUp(name: String, pass: String) {
       UserModel.userList.append(UserModel(name: name, password: pass))
        fieldUsername.text = String(name)
        fieldPassword.text = String(pass)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
            for i in UserModel.userList{
                if fieldUsername.text  == i.username && fieldPassword.text == i.password {
                    print("Login Success \(i.username) and \(i.password)")
                    dismiss(animated: true, completion: nil)
                    userLoginDelegate.displayUserName(name: "\(i.username)")
                    fieldPassword.text = ""
                    fieldUsername.text = ""
                    break
                }
            }
        
        
    }
}

