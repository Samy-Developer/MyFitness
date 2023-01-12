//
//  ViewController.swift
//  dzfind
//
//  Created by Naimi Samir on 25/03/2021.
//  Copyright © 2021 Naimi Samir. All rights reserved.
//


import UIKit
import SafariServices;
import WebKit
import PhotosUI

class ViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    

    
    func gotoAppPrivacySettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(url) else {
                assertionFailure("Not able to open App privacy settings")
                return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
   

    func proceedWithCameraAcess(identifier: String)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        PHPhotoLibrary.requestAuthorization({ (newStatus) in if newStatus == PHAuthorizationStatus.authorized{} })
        
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted
            {
            // todo 
            }
            
        }
        
        
        let myURL = URL(string: "https://www.ma-fitness.fr")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
