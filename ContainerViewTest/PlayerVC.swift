//
//  PlayerVC.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/16/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

let tabBarOffset: CGFloat = 5.0

class PlayerVC: UIViewController    {
  
  var topOfFrame: CGFloat = 0.0
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet weak var podcastImageView: UIImageView!
  
  var tapGesture: UITapGestureRecognizer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topOfFrame = -(self.view.frame.height - 65) // -671.0 on 6+
    
  }
  
  @IBAction func showFullPlayerPanGesture(gesture: UIPanGestureRecognizer) {
    //swipe up

    let translation = gesture.translationInView(self.view)
    
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (translation.y > CGFloat(-100.0)) {
        resetMiniPlayer()
      } else {
        showFullPlayer()
      }//if
    } else { //if state
      self.view.frame.origin.y = translation.y
    }
  }//showplayergesture
  
  @IBAction func hidFullPlayerGesture(gesture: UIPanGestureRecognizer) {
    print("hidePlayerGesture")
    //swipe down
    let point = gesture.locationInView(self.view)
    print("point: \(point)")
    let translation = gesture.translationInView(self.view)
    print("translation: \(translation)")
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (translation.y > CGFloat(20.0)) {
        resetMiniPlayer()
      } else {
        showFullPlayer()
      }//if
    }//if state
  }//func
  
  func showFullPlayer() {
    UIView.animateWithDuration(0.5) { () -> Void in
      
      let containerView = self.view.superview
      containerView?.backgroundColor = UIColor.redColor()

      // WHAT TO DO WITH THIS FUCKER?
//      self.view.clipsToBounds = true
      
      //put playerview to top 
      self.view.frame.origin.y = self.topOfFrame
      
      self.tabBarController?.tabBar.alpha = 0
      self.topPlayerView?.alpha = 1
    }//animate
  }
  
  func resetMiniPlayer() {
    print("resetting miniplayer")
    UIView.animateWithDuration(0.25) { () -> Void in
      self.view.frame.origin.y = 0
      self.tabBarController?.tabBar.alpha = 1.0
      self.topPlayerView?.alpha = 1.0
    }//animate

  }
  
  @IBAction func bottomGrayBoxHideGesture(gesture: UIPanGestureRecognizer) {
    print(gesture)
  }

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}
