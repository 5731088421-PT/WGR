//
//  EditInfoViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/5/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class EditInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let cellNumber = [[1,2,3,4,4,5,4,4,4,4,5,6],[8,7,7,8]]
    let cellName = [["","About","Contact Information","Company","Current work","Current salary","My skills","Education institute","Degree","Gender","Age","Upload CV"],["","Don't show my education","Don't show my age",""]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellNumber[indexPath.section][indexPath.row] {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileImage", for: indexPath) as? ProfileImageTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "aboutInfo", for: indexPath) as? AboutTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactInfo", for: indexPath) as? ContactInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "selectInfo", for: indexPath) as? SelectInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sliderInfo", for: indexPath) as? SliderInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "uploadInfo", for: indexPath) as? UploadInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchInfo", for: indexPath) as? SwitchInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            cell.name = cellName[indexPath.section][indexPath.row]
            return cell
        case 8:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sectHeader", for: indexPath) as? SectionHeaderTableViewCell  else {
                fatalError("The dequeued cell is not an instance.")
            }
            return cell
        default:
            var cell: UITableViewCell = UITableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
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
