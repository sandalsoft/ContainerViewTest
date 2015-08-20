//
//  ViewController.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/16/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let offset: CGFloat = 20.0
    
    self.view.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: offset))
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

