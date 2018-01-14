//
//  TinderNavigationBar.swift
//  TinderNavDemo
//
//  Created by Ian MacCallum on 7/7/15.
//  Copyright © 2015 Ian MacCallum. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationBarDelegate: class {
    func navigationBar(navBar: NavigationBar, didSelectItemAtIndex index: Int)
}

class NavigationBar: UINavigationBar {
    
    var itemSize: CGFloat = 30
    var sideSpacing: CGFloat = 16
    var navItems: [String] = []
    
    weak var collectionView: UICollectionView?
    weak var navBarDelegate: NavigationBarDelegate?
    var navCollectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = (frame.width - 3 * itemSize - 2 * sideSpacing) / 2
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.scrollDirection = .horizontal
        layout.headerReferenceSize = CGSize.zero
        layout.footerReferenceSize = CGSize.zero
        layout.sectionInset = UIEdgeInsets.zero

        return layout
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navItems = ["0", "1", "2"]
        
        navCollectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        navCollectionView.register(NavigationCollectionViewCell.self, forCellWithReuseIdentifier: "NavigationCellID")
        navCollectionView.backgroundColor = nil
        navCollectionView.showsHorizontalScrollIndicator = false
        navCollectionView.dataSource = self
        navCollectionView.delegate = self
        
        addSubview(navCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        navCollectionView.frame = bounds
        navCollectionView.setCollectionViewLayout(layout, animated: false)
        navCollectionView.contentInset.left = navCollectionView.frame.width / 2 - itemSize / 2
        navCollectionView.contentInset.right = navCollectionView.frame.width / 2 - itemSize / 2
    }
}

extension NavigationBar: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return navItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NavigationCellID", for: indexPath) as! NavigationCollectionViewCell
        return cell
    }
}

extension NavigationBar: UICollectionViewDelegate {
    
    func snapToPage( scrollView: inout UIScrollView) {
        let x = (scrollView.contentOffset.x + scrollView.contentInset.left) / (layout.itemSize.width + layout.minimumLineSpacing)
        
        var item = round(x)
        if item < 0 {
            item = 0
        } else if item > CGFloat(navItems.count - 1) {
            item = CGFloat(navItems.count - 1)
        }
        
        let offset = item * (layout.itemSize.width + layout.minimumLineSpacing) - scrollView.contentInset.left
        scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("will begin dragging")
    }
    
    func scrollViewWillBeginDecelerating( _ scrollView: UIScrollView) {
        var scrollView = scrollView
        print("will begin decelerating")
        snapToPage(scrollView: &scrollView)
    }
    
    func scrollViewDidEndDragging( _ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var scrollView = scrollView
        print("did end dragging: will decelerate: \(decelerate)")
        snapToPage(scrollView: &scrollView)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        var scrollView = scrollView
        print("will end dragging: with velocity \(velocity): offset \(targetContentOffset.pointee)")
        snapToPage(scrollView: &scrollView)
    }
    
    func scrollViewDidEndDecelerating( _ scrollView: UIScrollView) {
        var scrollView = scrollView
        print("did end decelerating")
        snapToPage(scrollView: &scrollView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("did scroll")

        let percent = (scrollView.contentOffset.x + scrollView.contentInset.left) / (scrollView.contentSize.width - itemSize)
        let offset = percent * ((collectionView?.contentSize.width ?? 0) - (collectionView?.frame.width ?? 0))
        collectionView?.contentOffset.x = offset
    }
    
    func scrollViewDidEndScrollingAnimation( _ scrollView: UIScrollView) {
        
        var scrollView = scrollView
        print("did end animation")

        print("decelerating = \(scrollView.isDecelerating), dragging = \(scrollView.isDragging), tracking = \(scrollView.isTracking)")
        snapToPage(scrollView: &scrollView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let offset = CGFloat(indexPath.row) * (layout.itemSize.width + layout.minimumLineSpacing) - collectionView.contentInset.left
//        navCollectionView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
//        
//        navBarDelegate?.navigationBar(self, didSelectItemAtIndex: indexPath.row)
    }
}

class NavigationCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
