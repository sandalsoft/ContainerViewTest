//
//  PlayerVC.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/16/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

let tabBarOffset: CGFloat = 5.0

class PlayerVC: UIViewController {


  @IBOutlet weak var topPlayerView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func panDown(sender: UIPanGestureRecognizer) {
    let velocity = sender.velocityInView(self.view)
    
    if (velocity.y > 0) {
      UIView.animateWithDuration(0.5) { () -> Void in
        self.view.frame.origin.y = 0
        self.tabBarController?.tabBar.alpha = 1.0
        self.topPlayerView?.alpha = 1.0
      }//animate
    }//if
  }//panDown
  
  @IBAction func panVC(sender: UIPanGestureRecognizer) {
    let velocity = sender.velocityInView(self.view)
    
    if (velocity.y < 0) {
      print("pan up")
      UIView.animateWithDuration(0.5) { () -> Void in
        self.view.frame.origin.y = -(self.view.frame.height - 65)
        self.tabBarController?.tabBar.alpha = 0
        self.topPlayerView?.alpha = 0
      }//animate
    }//if
  }//panVC
  
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
