//
//  ViewController.swift
//  pizza
//
//  Created by Walter Llano on 18/09/2016.
//  Copyright © 2016 Walter Llano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController?
    var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateControllersArray()
        createPageViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func populateControllersArray() {
        for i in 0...3 {
            let controller = storyboard!.instantiateViewControllerWithIdentifier("viewController\(i)")
            controller.setValue(i, forKey: "pageIndex")
            controllers.append(controller)
        }
    }
    
    
    
    func createPageViewController() {
        let pageController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as!UIPageViewController
        
        pageController.dataSource = self
        
        if !controllers.isEmpty {
            pageController.setViewControllers([controllers[0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        
        //pageViewController!.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        
        pageViewController!.didMoveToParentViewController(self)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        
        if (viewController.valueForKey("pageIndex") as! Int) > 0 {
            return controllers[viewController.valueForKey("pageIndex") as! Int - 1]
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        if (viewController.valueForKey("pageIndex") as! Int) < (controllers.count - 1) {
            return controllers[viewController.valueForKey("pageIndex") as! Int + 1]
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

