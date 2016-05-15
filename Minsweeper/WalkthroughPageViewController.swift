//
//  WalkthroughPageViewController.swift
//  Minesweeper
//
//  Created by MF on 5/8/16.
//  Copyright © 2016 shahshawaiz. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["بارودی سرنگ", "Minesweeper"]
    var pageImages = ["step1","step2"]
    var pageContent = ["اس کھیل کا مقصد ہر میدان میں ہمسایہ بارودی سرنگوں کی تعداد کے بارے میں سراگ کی مدد سے ، ان میں سے کسی دھماکہ بغیر پوشیدہ بارودی سرنگوں  پر مشتمل ایک آئتاکار بورڈ کو صاف کرنے کے لئے ہے .","The goal of this game is to clear a rectangular board containing hidden mines without detonating any of them, with help from clues about the number of neighboring mines in each field."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        if let startingViewController = viewControllerAtIndex(0){
            setViewControllers([startingViewController], direction: .Forward , animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index++
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController
        viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index--
            
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index:Int) -> WalkthroughContentViewController?{
        
        if index == NSNotFound || index < 0 || index >= pageHeadings.count{
            return nil
        }
        
        if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController") as? WalkthroughContentViewController{
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.content = pageContent[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
