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
  var containerViewTop: CGFloat = 0.0
  
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet weak var podcastImageView: UIImageView!
  
  var tapGesture: UITapGestureRecognizer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topOfFrame = -(self.view.frame.height - 65) // -671.0 on 6+
  }
  
  override func viewDidAppear(animated: Bool) {
    containerViewTop = (self.view.superview?.frame.origin.y)!
    print("containerViewTop: \(containerViewTop)")

  }
  
  @IBAction func showFullPlayerPanGesture(gesture: UIPanGestureRecognizer) {
    //swipe up
    let containerY = self.view.superview!.frame.origin.y
    let translation = gesture.translationInView(self.view)
    
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (containerY < CGFloat(550.0)) {
        showFullPlayer()
      } else {
        resetMiniPlayer()
      }//if
    } else {
      self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
      gesture.setTranslation(CGPointZero, inView: self.view.superview)
    }//if state
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
      self.view.superview!.frame.origin.y = self.containerViewTop
      
      self.tabBarController?.tabBar.alpha = 0
      self.topPlayerView?.alpha = 1
    }//animate
  }
  
  func resetMiniPlayer() {
    print("resetting miniplayer")
    UIView.animateWithDuration(0.25) { () -> Void in

      self.view.superview?.frame.origin.y = self.containerViewTop
      
      
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
