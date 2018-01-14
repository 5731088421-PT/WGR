//
//  SettingViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/3/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit
import Firebase

protocol changeInputDataDelegate {
    func changeSelectedTo(value:[String],at indexpath:IndexPath, reloadCell : Bool)
}
protocol beginEditSelectedViewDelegate {
    func selectForEditing(From indexPath:IndexPath)
}


class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, changeInputDataDelegate, beginEditSelectedViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    enum CellType {
        case headInfo
        case selectInfo
        case sliderInfo
        case sliderRangeInfo
        case sectionHeader
        case picker
        case Textview
    }
    
    var selectedCell = [-1,-1]
    let cellType = [[CellType.headInfo],
                      [CellType.sectionHeader,
                       CellType.selectInfo,CellType.picker,
                       CellType.selectInfo,CellType.picker,
                       CellType.selectInfo,CellType.Textview,
                       CellType.sliderRangeInfo],
                      [CellType.sectionHeader,
                       CellType.sliderRangeInfo,
                       CellType.selectInfo,CellType.picker,
                       CellType.sliderRangeInfo,
                       CellType.selectInfo,CellType.picker,
                       CellType.selectInfo,CellType.picker,
                       CellType.sliderInfo,
                       CellType.selectInfo,CellType.picker],
                      [CellType.sectionHeader,
                       CellType.sliderInfo,
                       CellType.sliderInfo]]
    
    var cellName: [[String?]] = [[]]
    var cellValue = [IndexPath : [String]]()
    
    var userType: Int = 0
    var profileURL: String?
    var userName: String?
    var userWork: String?
    var pickerData: [IndexPath:[String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        setUpData(userType: userType)
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            // For some reason adding inset in keyboardWillShow is animated by itself but removing is not, that's why we have to use animateWithDuration here
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeSelectedTo(value: [String], at indexpath : IndexPath, reloadCell : Bool) {
        cellValue[indexpath] = value
        if(reloadCell){
            tableView.reloadRows(at: [indexpath], with: UITableViewRowAnimation.fade)
        }
    }
    
    func selectForEditing(From indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellType.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellType[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch cellType[indexPath.section][indexPath.row] {
        case CellType.headInfo:
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
        case CellType.selectInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectInfo", for: indexPath) as? SelectInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            if let val = cellValue[indexPath]{
                cell.select = val[0]
            } else {
                cell.select = "No Value"
            }
            return cell
        case CellType.sliderInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderInfo", for: indexPath) as? SliderInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            cell.sliderRangeValue = [1,20]
            cell.sliderValue = 5
            return cell
        case CellType.sliderRangeInfo:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderRangeInfo", for: indexPath) as? SliderRangeInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.delegate = self
            cell.indexPath = indexPath
//            if let val = cellValue[indexPath]{
//                cell.select = val[0] + "-" + val[1]
//            } else {
//                cell.select = "No Value"
//            }
            cell.name = cellName[indexPath.section][indexPath.row]
            cell.sliderRangeValue = [1,20]
            cell.sliderValue = [5,15]
            return cell
        case CellType.sectionHeader:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeader", for: indexPath) as? SectionHeaderTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case CellType.picker:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath) as? PickerTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
//            cell.name = cellName[indexPath.section][indexPath.row]
            cell.pickerData = pickerData![indexPath]
            cell.delegate = self
            let parentIndexPath = IndexPath(row: indexPath.row-1, section: indexPath.section)
            cell.parentIndexPath = parentIndexPath
            return cell
        case CellType.Textview:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textView", for: indexPath) as? TextViewTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
//            cell.name = cellName[indexPath.section][indexPath.row]
            cell.delegate = self
            cell.editDelegate = self
            let parentIndexPath = IndexPath(row: indexPath.row-1, section: indexPath.section)
            cell.parentIndexPath = parentIndexPath
            if let value = cellValue[parentIndexPath] {
                if value.count > 0{
                    cell.textData = value[0]
                }
                else {
                    cell.textData = ""
                }
            }
            else {
                cell.textData = ""
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.tableView.rowHeight
        let cellNum = cellType[indexPath.section][indexPath.row]
        if cellNum == CellType.picker{
           
            if indexPath.section == selectedCell[0] && indexPath.row-1 == selectedCell[1]{
                return 175
            }
            return 0
        }
        else if cellNum == CellType.Textview{
            if indexPath.section == selectedCell[0] && indexPath.row-1 == selectedCell[1]{
                return 175
            }
            return 0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = cellType[indexPath.section][indexPath.row]
        if type == CellType.selectInfo {
            var isScroll = false
            if selectedCell[0] == indexPath.section && selectedCell[1] == indexPath.row{
                selectedCell = [-1,-1]
            }else{
                selectedCell = [indexPath.section,indexPath.row]
                isScroll = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            if isScroll{
                let path = IndexPath(row: indexPath.row+1, section: indexPath.section)
                tableView.scrollToRow(at: path, at: UITableViewScrollPosition.middle, animated: true)
            }
        }
    }
   
    func setUpData(userType type: Int){
        switch type {
        case 0:
            cellName = [[],
                        ["What work are you looking for?",
                         "Type of Work","",
                         "Field of Work","",
                         "Desired job title","",
                         "Expected Salary Range"],
                        ["What Leader are you looking?",
                         "Leader's Years of experience",
                         "Leader skils","",
                         "Desired leader age",
                         "Desired leader gender","",
                         "Leader's Nationality","",
                         "Distance",
                         "Choose Location",""],
                        ["App Setting",
                         "Font size",
                         "Language"]]
        default:
            cellName = [[],
                        ["What job are you offering?",
                         "Type of Work",
                         "Field of Work",
                         "Job Offer - Title",
                         "Monthly Salary Range"],
                        ["What Candidate are you looking for?",
                         "Candidate years of experience",
                         "Candidate Skills",
                         "Desired Candidate Age",
                         "Desired Candidate Gender",
                         "Candidate's Nationality",
                         "Distance",
                         "Choose location"],
                        ["App Setting",
                         "Font size",
                         "Language"]]
        }
        
        pickerData = [IndexPath(row: 2, section: 1):["Fixed Work","Flexible Work ","Full Time","Part Time"],
                      IndexPath(row: 4, section: 1):["Accounting", "Admin & HR", "Aerospace", "Aerospace", "Agriculture ", "Alchololic beverages", "Architechture", "Automotive", "Banking / Finance", "Beauty Care / Health", "Building & Construction", "Chemical", "Construction", "Defense", "Design ", "Education", "Energy", "Engineering", "Entertainment", "Financial services", "FMCG ", "Food and Beverage", "Government", "Health care industry", "Hospitality", "Information Technology (IT)", "Insurance", "Internet / Online Media / Digital", "Management Consulting", "Manufacturing", "Manufacturing", "Marketing / Public Relations", "Media & Advertising", "Medical", "Merchandising & Purchasing", "Pharmaceutical", "Professional Services", "Property", "Public / Civil", "Publishing", "Reneweable Energy", "Sales, CS & Business Devpt", "Sciences, Lab, R&D", "Software industry", "Telecommunications", "Textlile", "Tobacco", "Transportation & Logistics", "Shipping"],
                      IndexPath(row: 3, section: 2):["Accounting", "Admin & HR", "Aerospace", "Aerospace", "Agriculture ", "Alchololic beverages", "Architechture", "Automotive", "Banking / Finance", "Beauty Care / Health", "Building & Construction", "Chemical", "Construction", "Defense", "Design ", "Education", "Energy", "Engineering", "Entertainment", "Financial services", "FMCG ", "Food and Beverage", "Government", "Health care industry", "Hospitality", "Information Technology (IT)", "Insurance", "Internet / Online Media / Digital", "Management Consulting", "Manufacturing", "Manufacturing", "Marketing / Public Relations", "Media & Advertising", "Medical", "Merchandising & Purchasing", "Pharmaceutical", "Professional Services", "Property", "Public / Civil", "Publishing", "Reneweable Energy", "Sales, CS & Business Devpt", "Sciences, Lab, R&D", "Software industry", "Telecommunications", "Textlile", "Tobacco", "Transportation & Logistics", "Shipping"],
                      IndexPath(row: 6, section: 2):["Male","Female"],
                      IndexPath(row: 8, section: 2):["Afghan", "Albanian", "Algerian", "American", "Andorran", "Angolan", "Antiguans", "Argentinean", "Armenian", "Australian", "Austrian", "Azerbaijani", "Bahamian", "Bahraini", "Bangladeshi", "Barbadian", "Barbudans", "Batswana", "Belarusian", "Belgian", "Belizean", "Beninese", "Bhutanese", "Bolivian", "Bosnian", "Brazilian", "British", "Bruneian", "Bulgarian", "Burkinabe", "Burmese", "Burundian", "Cambodian", "Cameroonian", "Canadian", "Cape Verdean", "Central African", "Chadian", "Chilean", "Chinese", "Colombian", "Comoran", "Congolese", "Costa Rican", "Croatian", "Cuban", "Cypriot", "Czech", "Danish", "Djibouti", "Dominican", "Dutch", "East Timorese", "Ecuadorean", "Egyptian", "Emirian", "Equatorial Guinean", "Eritrean", "Estonian", "Ethiopian", "Fijian", "Filipino", "Finnish", "French", "Gabonese", "Gambian", "Georgian", "German", "Ghanaian", "Greek", "Grenadian", "Guatemalan", "Guinea-Bissauan", "Guinean", "Guyanese", "Haitian", "Herzegovinian", "Honduran", "Hungarian", "I-Kiribati", "Icelander", "Indian", "Indonesian", "Iranian", "Iraqi", "Irish", "Israeli", "Italian", "Ivorian", "Jamaican", "Japanese", "Jordanian", "Kazakhstani", "Kenyan", "Kittian and Nevisian", "Kuwaiti", "Kyrgyz", "Laotian", "Latvian", "Lebanese", "Liberian", "Libyan", "Liechtensteiner", "Lithuanian", "Luxembourger", "Macedonian", "Malagasy", "Malawian", "Malaysian", "Maldivian", "Malian", "Maltese", "Marshallese", "Mauritanian", "Mauritian", "Mexican", "Micronesian", "Moldovan", "Monacan", "Mongolian", "Moroccan", "Mosotho", "Motswana", "Mozambican", "Namibian", "Nauruan", "Nepalese", "New Zealander", "Ni-Vanuatu", "Nicaraguan", "Nigerian", "Nigerien", "North Korean", "Northern Irish", "Norwegian", "Omani", "Pakistani", "Palauan", "Panamanian", "Papua New Guinean", "Paraguayan", "Peruvian", "Polish", "Portuguese", "Qatari", "Romanian", "Russian", "Rwandan", "Saint Lucian", "Salvadoran", "Samoan", "San Marinese", "Sao Tomean", "Saudi", "Scottish", "Senegalese", "Serbian", "Seychellois", "Sierra Leonean", "Singaporean", "Slovakian", "Slovenian", "Solomon Islander", "Somali", "South African", "South Korean", "Spanish", "Sri Lankan", "Sudanese", "Surinamer", "Swazi", "Swedish", "Swiss", "Syrian", "Taiwanese", "Tajik", "Tanzanian", "Thai", "Togolese", "Tongan", "Trinidadian or Tobagonian", "Tunisian", "Turkish", "Tuvaluan", "Ugandan", "Ukrainian", "Uruguayan", "Uzbekistani", "Venezuelan", "Vietnamese", "Welsh", "Yemenite", "Zambian", "Zimbabwean"],
                      IndexPath(row: 11, section: 2):["Afghan", "Albanian", "Algerian", "American", "Andorran", "Angolan", "Antiguans", "Argentinean", "Armenian", "Australian", "Austrian", "Azerbaijani", "Bahamian", "Bahraini", "Bangladeshi", "Barbadian", "Barbudans", "Batswana", "Belarusian", "Belgian", "Belizean", "Beninese", "Bhutanese", "Bolivian", "Bosnian", "Brazilian", "British", "Bruneian", "Bulgarian", "Burkinabe", "Burmese", "Burundian", "Cambodian", "Cameroonian", "Canadian", "Cape Verdean", "Central African", "Chadian", "Chilean", "Chinese", "Colombian", "Comoran", "Congolese", "Costa Rican", "Croatian", "Cuban", "Cypriot", "Czech", "Danish", "Djibouti", "Dominican", "Dutch", "East Timorese", "Ecuadorean", "Egyptian", "Emirian", "Equatorial Guinean", "Eritrean", "Estonian", "Ethiopian", "Fijian", "Filipino", "Finnish", "French", "Gabonese", "Gambian", "Georgian", "German", "Ghanaian", "Greek", "Grenadian", "Guatemalan", "Guinea-Bissauan", "Guinean", "Guyanese", "Haitian", "Herzegovinian", "Honduran", "Hungarian", "I-Kiribati", "Icelander", "Indian", "Indonesian", "Iranian", "Iraqi", "Irish", "Israeli", "Italian", "Ivorian", "Jamaican", "Japanese", "Jordanian", "Kazakhstani", "Kenyan", "Kittian and Nevisian", "Kuwaiti", "Kyrgyz", "Laotian", "Latvian", "Lebanese", "Liberian", "Libyan", "Liechtensteiner", "Lithuanian", "Luxembourger", "Macedonian", "Malagasy", "Malawian", "Malaysian", "Maldivian", "Malian", "Maltese", "Marshallese", "Mauritanian", "Mauritian", "Mexican", "Micronesian", "Moldovan", "Monacan", "Mongolian", "Moroccan", "Mosotho", "Motswana", "Mozambican", "Namibian", "Nauruan", "Nepalese", "New Zealander", "Ni-Vanuatu", "Nicaraguan", "Nigerian", "Nigerien", "North Korean", "Northern Irish", "Norwegian", "Omani", "Pakistani", "Palauan", "Panamanian", "Papua New Guinean", "Paraguayan", "Peruvian", "Polish", "Portuguese", "Qatari", "Romanian", "Russian", "Rwandan", "Saint Lucian", "Salvadoran", "Samoan", "San Marinese", "Sao Tomean", "Saudi", "Scottish", "Senegalese", "Serbian", "Seychellois", "Sierra Leonean", "Singaporean", "Slovakian", "Slovenian", "Solomon Islander", "Somali", "South African", "South Korean", "Spanish", "Sri Lankan", "Sudanese", "Surinamer", "Swazi", "Swedish", "Swiss", "Syrian", "Taiwanese", "Tajik", "Tanzanian", "Thai", "Togolese", "Tongan", "Trinidadian or Tobagonian", "Tunisian", "Turkish", "Tuvaluan", "Ugandan", "Ukrainian", "Uruguayan", "Uzbekistani", "Venezuelan", "Vietnamese", "Welsh", "Yemenite", "Zambian", "Zimbabwean"]
            
                      ]
        
        
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
