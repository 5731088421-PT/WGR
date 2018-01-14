//
//  SettingViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit
import Firebase

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let cellNumber = [[0], [4,1,1,1,3], [4,3,1,3,1,1,2,1], [4,2,1]]
    var cellName: [[String?]] = [[]]
    var userType: Int = 0
    var profileURL: String?
    var userName: String?
    var userWork: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpData(userType: userType)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellNumber.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch cellNumber[indexPath.section][indexPath.row] {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "headInfo", for: indexPath) as? HeadInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = userName
            cell.work = "Work"
            getImageFromWeb(profileURL ?? "") { (image) in
                if let image = image {
                    cell.profileImage.image = image
                } // if you use an Else statement, it will be in background
            }
            cell.gradientBackground()
            cell.dropShadow()
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectInfo", for: indexPath) as? SelectInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderInfo", for: indexPath) as? SliderInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderRangeInfo", for: indexPath) as? SliderRangeInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeader", for: indexPath) as? SectionHeaderTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        default:
            var cell: UITableViewCell = UITableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
   
    func setUpData(userType type: Int){
        switch type {
        case 0:
            cellName = [[],["What work are you looking for?", "Type of Work", "Field of Work", "Desired job title", "Expected Salary Range"],["What Leader are you looking?", "Leader's Years of experience", "Leader skils", "Desired leader age", "Desired leader gender", "Leader's Nationality", "Distance", "Choose Location"],["App Setting", "Font size", "Language"]]
        default:
            cellName = [[],["What job are you offering?", "Type of Work", "Field of Work", "Job Offer - Title", "Monthly Salary Range"],["What Candidate are you looking for?", "Candidate years of experience", "Candidate Skills", "Desired Candidate Age", "Desired Candidate Gender", "Candidate's Nationality", "Distance", "Choose location"],["App Setting", "Font size", "Language"]]
        }
        
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            if let user = user {
                for profile in user.providerData{
                    //                    let id = profile.providerID
                    //                    let email = profile.email
                    userName = profile.displayName
                    profileURL = profile.photoURL?.absoluteString
                    if profile.providerID == "facebook.com"{
                        let fbUserID = profile.uid
                        profileURL = "https://graph.facebook.com/" + fbUserID + "/picture?height=500"
                    }
                }
            }
//            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email, gender, work"]).start(completionHandler: { (connection, result, error) -> Void in
//                if (error == nil){
//                    let fbDetails = result as! NSDictionary
//                    print(fbDetails)
//                }else{
//                    print(error?.localizedDescription ?? "Not found")
//                }
//            })
            
        } else {
            // No user is signed in.
            // ...
        }

    }
    
    func getImageFromWeb(_ urlString: String, closure: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: urlString) else {
            return closure(nil)
        }
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return closure(nil)
            }
            guard response != nil else {
                print("no response")
                return closure(nil)
            }
            guard data != nil else {
                print("no data")
                return closure(nil)
            }
            DispatchQueue.main.async {
                closure(UIImage(data: data!))
            }
        }; task.resume()
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
