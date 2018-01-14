//
//  MainViewController.swift
//  WorkGuru
//
//  Created by Panupong on 12/29/17.
//  Copyright © 2017 Panupong. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirstViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                for profile in user.providerData{
                    let id = profile.providerID
                    let email = profile.email
                    let name = profile.displayName
                    nameLabel.text = "Welcome " + (name ?? "") + "!"
                }
            }
        } else {
            // No user is signed in.
            // ...
        }

//        nameLabel.text = "welcome"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
