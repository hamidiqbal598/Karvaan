//
//  AdminLoginViewController.swift
//  Karvaan
//
//  Created by Hamid khan on 03/05/2019.
//  Copyright © 2019 AhmadShaheer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class AdminLoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInButton(_ sender: UIButton)
    {
        if let Email=email.text, let Password=password.text
        {
            Auth.auth().signIn(withEmail: Email,password: Password) { (user, error) in
                // ...
                if let _=user
                {
                    self.performSegue(withIdentifier: "successfullySignIn", sender: nil)
                }
                else
                {
                    print("error")
                }
            }
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
