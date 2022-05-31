//
//  ViewController.swift
//  Sample-Swift
//
//  Created by eric on 2022/4/8.
//

import UIKit
import XCSDK

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    @IBAction func showICONSDK(_ sender: UIButton) {
        let config : [String : Any] = [
            XCSDKMainUrlKey : "http://dev.m.yc365d.com",
            XCSDKImgUrlKey : "http://dev.img.yc365d.com",
            XCSDKImUrlKey : "ws://dev.m.yc365d.com",
        ]
                
        XCSDKManager.openIconSdk(config, naviVC: navigationController! , configError: nil) { (method, params) in
            NSLog("method\(method)")
        }
    }
    
    @IBAction func showTABSDK(_ sender: UIButton) {
        navigationController?.pushViewController(TabBarVC.init(), animated: true)
    }
}

