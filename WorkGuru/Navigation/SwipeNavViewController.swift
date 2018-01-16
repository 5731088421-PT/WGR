//
//  SwipeNavViewController.swift
//  WorkGuru
//
//  Created by Panupong on 1/15/18.
//  Copyright © 2018 Panupong. All rights reserved.
//

import UIKit

class SwipeNavViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UIScrollViewDelegate{
    
    var navBar: NavigationBar?
    var stackPageVC: [UIViewController]!
    var currentStackVC: UIViewController!


    override func viewDidLoad() {
        super.viewDidLoad()
        navBar = navigationController?.navigationBar as? NavigationBar
        navBar?.navBarDelegate = self
        
        self.delegate = self
        self.dataSource = self
        
        let mainStb = UIStoryboard(name: "Main", bundle: nil)
        let oneVC = mainStb.instantiateViewController(withIdentifier: "SettingViewController")
        let twoVC = mainStb.instantiateViewController(withIdentifier: "DiscoverViewController")
        let threeVC = mainStb.instantiateViewController(withIdentifier: "ChatViewController")
        stackPageVC = [oneVC, twoVC, threeVC]
        currentStackVC = stackPageVC[1]
        setViewControllers([currentStackVC], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        
        for view in self.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if stackPageVC.index(of: currentStackVC) == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        } else if stackPageVC.index(of: currentStackVC) == stackPageVC.count - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if stackPageVC.index(of: currentStackVC) == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        } else if stackPageVC.index(of: currentStackVC) == stackPageVC.count - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width {
            scrollView.contentOffset = CGPoint(x: scrollView.bounds.size.width, y: 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController == stackPageVC.first {
            return nil
        }
        return stackPageVC[stackPageVC.index(of: viewController)! - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == stackPageVC.last {
            return nil
        }
        return stackPageVC[stackPageVC.index(of: viewController)! + 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        
        let newVCIndex = stackPageVC.index(of: pageViewController.viewControllers!.first!)!
        
//        datasource?.changedToPageIndex?(newVCIndex)
//
        currentStackVC = stackPageVC[newVCIndex]
    }
    
    public func moveToPage(_ index: Int, animated: Bool) {
        let currentIndex = stackPageVC.index(of: currentStackVC)!
        
        var direction: UIPageViewControllerNavigationDirection = .reverse
        
        if index > currentIndex {
            direction = .forward
        }
        
//        datasource?.changedToPageIndex?(index)
        currentStackVC = stackPageVC[index]
        
        self.setViewControllers([currentStackVC], direction: direction, animated: animated, completion: nil)
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

extension SwipeNavViewController: NavigationBarDelegate {
    
    func navigationBar(navBar: NavigationBar, didSelectItemAtIndex index: Int) {
//        collectionView?.setContentOffset(CGPoint(x: CGFloat(index) * (collectionView?.frame.width ?? 1), y: 0), animated: true)
        moveToPage(index, animated: true)
    }
}

