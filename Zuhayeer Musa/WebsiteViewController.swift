//
//  WebsiteViewController.swift
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/25/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

import UIKit

@objc(WebsiteViewController) class WebsiteViewController: UIViewController, UIWebViewDelegate {
    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var website: String?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Website";
        
        webView.delegate = self;
        var url : NSURL! = NSURL(string: website!);
        var req : NSURLRequest! = NSURLRequest(URL: url);
        webView.loadRequest(req);
    }
    
    @IBAction func openInSafari(sender: AnyObject) {
        var url:NSURL! = NSURL(string: website!)
        UIApplication.sharedApplication().openURL(url)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        activityIndicator?.hidden = false;
        activityIndicator?.startAnimating();
        return true;
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator?.stopAnimating();
        activityIndicator?.hidden = true;
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        activityIndicator?.stopAnimating();
        activityIndicator?.hidden = true;
    }
}
