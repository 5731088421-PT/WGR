//
//  MainSwipeCollectionViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/14/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainSwipeCollectionViewController: UICollectionViewController {
    
    var navBar: NavigationBar?
    var startPoint: CGPoint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar = navigationController?.navigationBar as? NavigationBar
        navBar?.navBarDelegate = self
        navBar?.collectionView = collectionView
        collectionView?.alwaysBounceHorizontal = true
        collectionView?.setContentOffset(CGPoint.zero, animated: false)
        
        collectionView?.register(UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCellID")
        collectionView?.register(UINib(nibName: "SwapCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SwapCellID")
        collectionView?.register(UINib(nibName: "ContactsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContactsCellID")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

// MARK - CollectionView Data Source
extension MainSwipeCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCellID", for: indexPath as IndexPath) as! ProfileCollectionViewCell
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwapCellID", for: indexPath as IndexPath) as! SwapCollectionViewCell
            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactsCellID", for: indexPath as IndexPath) as! ContactsCollectionViewCell
            return cell

        default:

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCellID", for: indexPath as IndexPath) as! ProfileCollectionViewCell
            return cell
        }
    }
}


// MARK - CollectionView Delegate Flow Layout
extension MainSwipeCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return view.frame.size
    }
}

// MARK - ScrollView Delegate

extension MainSwipeCollectionViewController {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let percent = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        let contentWidth = (navBar?.navCollectionView?.contentSize.width ?? 0)
        let frameWidth = (navBar?.navCollectionView?.frame.width ?? 0)
        let leftInset = (navBar?.navCollectionView.contentInset.left ?? 0)
        let rightInset = (navBar?.navCollectionView.contentInset.right ?? 0)
        let offset = -leftInset + percent * (contentWidth + leftInset + rightInset - frameWidth)
        
        navBar?.navCollectionView.contentOffset.x = offset
    }
}


// MARK - NavigationBar Delegate
extension MainSwipeCollectionViewController: NavigationBarDelegate {
    
    func navigationBar(navBar: NavigationBar, didSelectItemAtIndex index: Int) {
        collectionView?.setContentOffset(CGPoint(x: CGFloat(index) * (collectionView?.frame.width ?? 1), y: 0), animated: true)
        
    }
}

