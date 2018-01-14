//
//  ViewController.swift
//  WorkGuru
//
//  Created by Panupong on 12/26/17.
//  Copyright © 2017 Panupong. All rights reserved.
//

import UIKit
import AVKit
//import SLPagingViewSwift_Swift3

class FirstViewController: UIViewController {
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false

    @IBAction func goToMainPage(_ sender: Any) {
        
        instantiateControllers()
        setItems()
        
        let items = [UIImageView(image: chat),
                     UIImageView(image: gear),
                     UIImageView(image: profile)]
        
        let controllers = [oneVC!,
                           twoVC!,
                           threeVC!]
//        controller = SLPagingViewSwift(items: items, controllers: controllers, showPageControl: false)
        
        setupController()
        setRoot()
        self.dismiss(animated: true, completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        let theURL = Bundle.main.url(forResource: "3", withExtension: "mp4")

        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = UIColor.clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                                         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                         object: avPlayer.currentItem)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
//        p.seek(to: kCMTimeZero)
        p.seek(to: kCMTimeZero, completionHandler: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.play()
        paused = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

