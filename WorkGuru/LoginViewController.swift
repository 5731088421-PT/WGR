//
//  LoginViewController.swift
//  WorkGuru
//
//  Created by Panupong on 12/26/17.
//  Copyright © 2017 Panupong. All rights reserved.
//

import UIKit
import ImageSlideshow
import FBSDKLoginKit
import Firebase

class LoginViewController: UIViewController {

    let imgs = [ImageSource(image: #imageLiteral(resourceName: "guide1")),ImageSource(image: #imageLiteral(resourceName: "guide2")),ImageSource(image: #imageLiteral(resourceName: "guide3"))]
    let desc = ["Swipe right to like a candidate\nSwipe left to pass.",
                "It's a Match when your candidate\nalso swipe right for you.",
                "Once you've matched, you can chat\nwith each other."]
    @IBOutlet weak var slideGuide: ImageSlideshow!
    @IBOutlet weak var slideDesc: UILabel!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    @IBAction func fbLogin(_ sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_birthday", "user_education_history", "user_work_history"], from: self) { (result, error) in
        
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
     
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                
                // Present the main view
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingController") {
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    self.dismiss(animated: true, completion: nil)
                }
                
            })
        }
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIApplication.shared.setStatusBarHidden(false, with: .slide)
        pageIndicator.numberOfPages = desc.count
        pageIndicator.currentPage = 0
        pageIndicator.pageIndicatorTintColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0)
        pageIndicator.currentPageIndicatorTintColor = UIColor(red:0.99, green:0.76, blue:0.12, alpha:1.0)
        slideDesc.textColor = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0)
        slideDesc.text = desc[0]
        slideGuide.setImageInputs(imgs)
        slideGuide.slideshowInterval = 5.0

        slideGuide.pageControlPosition = PageControlPosition.hidden
        slideGuide.currentPageChanged = { [weak self] page in
            if page < (self?.desc.count)!{
                self?.slideDesc.text = self?.desc[page]
                self?.pageIndicator.currentPage = page
            }
        }
       
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
