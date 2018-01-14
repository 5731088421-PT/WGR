//
//  MainSwipeViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/12/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit
//import EZSwipeController
//import SwipeNavigationController
import SLPagingViewSwift_Swift3

class MainSwipeViewController: SLPagingViewSwift {
    
//    override func setupView() {
//        datasource = self
//    }
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let centerVC = storyboard.instantiateViewController(withIdentifier: "DiscoverViewController")
//    let leftVC = storyboard.instantiateViewController(withIdentifier: "SettingViewController")
//    let rightVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
    
//    required init(coder decoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let centerVC = storyboard.instantiateViewController(withIdentifier: "DiscoverViewController")
//        let leftVC = storyboard.instantiateViewController(withIdentifier: "SettingViewController")
//        let rightVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
//
//        super.init(controllers: [centerVC, leftVC, rightVC])
//    }
    
//    required init(coder decoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let centerVC = storyboard.instantiateViewController(withIdentifier: "DiscoverViewController")
//        let leftVC = storyboard.instantiateViewController(withIdentifier: "SettingViewController")
//        let rightVC = storyboard.instantiateViewController(withIdentifier: "ChatViewController")
//        super.init(items: [], controllers: [], showPageControl: true)
//    }
//    init(frame: CGRect){
////        super.init(items: [], controllers: [], showPageControl: true)
//
    //    }
    
//    init() {
//        super.init(items: [], controllers: [], showPageControl: false)
//    }
    
    required init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        self.navigationController
//        self.leftViewController = leftVC
//        self.rightViewController = rightVC
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

//extension MainSwipeViewController: EZSwipeControllerDataSource{
//    func viewControllerData() -> [UIViewController] {
//        let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController")
//        let discoverViewController = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverViewController")
//        let chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController")
//        return [settingViewController!, discoverViewController!, chatViewController!]
//    }
//}

