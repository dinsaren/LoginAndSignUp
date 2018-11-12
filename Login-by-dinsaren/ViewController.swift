//
//  ViewController.swift
//  Login-by-dinsaren
//
//  Created by Dinsaren on 11/8/18.
//  Copyright © 2018 Dinsaren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var butonLabalNama: UIButton!
    var loginViewController : LoginViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonOpenLogin(_ sender: Any) {
        if butonLabalNama.currentTitle == "Login Your Account"{
            let loginViewController = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            loginViewController.userLoginDelegate=self
            show(loginViewController, sender: nil)
        }else{
            butonLabalNama.setTitle("Login Your Account", for:.normal)
            butonLabalNama.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
            labelName.text = "Wellcome To Khmer Academy"
            
        }
       
        
    }
}
extension ViewController:UserLoginDelegate{
    func displayUserName(name: String) {
        if name == "" {
            print("No Data")
        }else{
             labelName.text = "Wellcome \(name) !"
             butonLabalNama.setTitle("LogOut", for:.normal)
             butonLabalNama.setTitleColor(.red, for: .normal)
            
        }
       
    }
}

