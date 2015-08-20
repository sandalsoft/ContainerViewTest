//
//  PlaylistViewController.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/18/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {

  @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

      let containerViewOffset: CGFloat = -89.0
      self.view.addConstraint(NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: containerViewOffset))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
