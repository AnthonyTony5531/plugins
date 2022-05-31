//
//  TabBarVC.swift
//  Sample-Swift
//
//  Created by eric on 2022/4/8.
//

import UIKit
import XCSDK

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    let kTitles = ["广场", "游戏", "体育", "注单", "我的"]
    
    var lazyLoadMode = true
    var didConfigSDK = false
    var mainPage : UIViewController?
    var betPage : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 推荐方式：懒加载方式
        lazyLoadTABSDK()
        
        // 直接加载
        //loadTABSDK();
    }
    

    func lazyLoadTABSDK() {
        lazyLoadMode = true;
        initViewControllers()
        initTabBar()
    }
    
    
    func loadTABSDK() {
        lazyLoadMode = false;
        initViewControllers()
        initTabBar()
    }
    
    func initViewControllers() {
        self.delegate = self;
        
        let mainNavVC = self.navigationVC(2)
        let betNavVC = self.navigationVC(3)
        
        if(!self.lazyLoadMode) {
            _ = configTabSDK()
            let mainPage = XCSDKManager.mainPage()
            let betPage = XCSDKManager.betPage()
            mainNavVC.viewControllers = [mainPage!]
            betNavVC.viewControllers = [betPage!]
            
            self.mainPage = mainPage;
            self.betPage = betPage;
        }
        
        self.viewControllers = [
            navigationVC(0),
            navigationVC(1),
            mainNavVC, // 先展示一个占位/空页面
            betNavVC, // 先展示一个占位/空页面-按需添加
            navigationVC(4),
        ];
        
        if !lazyLoadMode {
            selectedIndex = 2
        }
    }
    
    func initTabBar() {
        if #available(iOS 13.0, *) {
            let naviBarAppearance = UINavigationBarAppearance.init(idiom: .phone)
            naviBarAppearance.backgroundColor = UIColor.white;
            naviBarAppearance.backgroundEffect = nil;
            naviBarAppearance.shadowColor = UIColor.clear;
            UINavigationBar.appearance().standardAppearance = naviBarAppearance;
            UINavigationBar.appearance().scrollEdgeAppearance = naviBarAppearance;
            
            let tabbarAppearance = UITabBarAppearance.init(idiom: .phone);
            tabbarAppearance.backgroundColor = UIColor.white;
            tabbarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().standardAppearance = tabbarAppearance;
            
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabbarAppearance
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        
        for i in 0..<5 {
            let item : UITabBarItem = self.tabBar.items?[i] ?? UITabBarItem.init()
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
            item.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue], for: .selected)
            item.selectedImage = UIImage.init(named: "nav_mine_selected")?.withRenderingMode(.alwaysOriginal)
            item.image = UIImage.init(named: "nav_mine_normal")?.withRenderingMode(.alwaysOriginal)
            item.title = kTitles[i];
        }
    }
    
    
    func configTabSDK() -> Bool {
        let config : [String : Any] = [
            XCSDKMainUrlKey : "http://dev.m.yc365d.com",
            XCSDKImgUrlKey  : "http://dev.img.yc365d.com",
            XCSDKImUrlKey   : "ws://dev.m.yc365d.com",
            // XCSDKTokenKey不传为匿名方式访问SDK，TAB版匿名方式进入SDK仅供商户快速接入，实际应用登录token是必传的
            //XCSDKTokenKey   : "登录token"
        ]
        do {
            try XCSDKManager.configTabSdk(config, tabbarVC: self) { (method, params) in
                
            }
        } catch _ {
            
        }
        didConfigSDK = true
        
        return true
    }
    
    func navigationVC(_ index: Int) -> UINavigationController {
        var idx = index;
        if idx > 4 {
            idx = idx % 5;
        }
        
        let vc = UIViewController.init()
        vc.view.backgroundColor = .white
        vc.title = kTitles[idx];
        let navVC = UINavigationController.init(rootViewController: vc)
        if idx == 2 || idx == 3 {
            navVC.setNavigationBarHidden(true, animated: false)
        }
        else {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            btn.setTitle("退出SDK", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .orange
            vc.view.addSubview(btn)
            btn.center = vc.view.center
            btn.addTarget(self, action:#selector(exitTABSDK) , for: .touchUpInside)
        }
        return navVC
    }
    
    @objc func exitTABSDK() {
        if mainPage != nil || betPage != nil {
            XCSDKManager.destroy(byPageIds: nil) // SDK页面释放
        }
        navigationController?.popViewController(animated: true)
    }
    

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if lazyLoadMode {
            if selectedIndex == 2 || selectedIndex == 2 {
                if !didConfigSDK {
                    _ = configTabSDK()
                }
                let navVC = viewController as! UINavigationController;
                if selectedIndex == 2 && mainPage == nil {
                    let page = XCSDKManager.mainPage()
                    mainPage = page;
                    navVC.viewControllers = [page!];
                }
                else if selectedIndex == 3 && betPage == nil {
                    let page = XCSDKManager.betPage(); // 先创建mainPage，然后再创建betPage
                    betPage = page;
                    navVC.viewControllers = [page!];
                }
            }
        }
        
        if(selectedIndex == 2) {
            XCSDKManager.startVideo() // 切回主页播放视频
        }
        else {
            XCSDKManager.pauseVideo() // 切非主页暂停视频
        }
    }
    
    deinit {
        NSLog("TabBarVC-dealloc")
    }
}
