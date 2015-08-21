//
//  PlayerVC.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/16/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

let tabBarOffset: CGFloat = 5.0

class PlayerVC: UIViewController, UIGestureRecognizerDelegate {
  
  var topOfFrameYCoord: CGFloat = 0.0
  
  var hidePlayerPanGestureRecognizer: UIPanGestureRecognizer?
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet var mainView: UIView!
  
  @IBOutlet weak var podcastImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topOfFrameYCoord = -(self.view.frame.height - 65) // -671.0 on 6+
    hidePlayerPanGestureRecognizer?.delegate = self
    hidePlayerPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("hideFullPlayerGesture:"))
    
    self.view.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin
    
  }
  

  @IBAction func showFullPlayerPanGesture(gesture: UIPanGestureRecognizer) {
    //swipe up

    let translation = gesture.translationInView(self.view)
    
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (translation.y > CGFloat(-100.0)) {
        resetMiniPlayer(gesture)
      } else {
        showFullPlayer(gesture)
      }//if
      
      gesture.setTranslation(CGPointMake(0, 0), inView:self.view)
    } else { //if state
      self.view.frame.origin.y = translation.y
    }
    
    
    
  }//showplayergesture
  
  func hideFullPlayerGesture(gesture: UIPanGestureRecognizer) {
    print("hidePlayerGesture")
    //swipe down
    let point = gesture.locationInView(self.view)
    print("point: \(point)")
    let translation = gesture.translationInView(self.view)
    print("translation: \(translation)")
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (translation.y > CGFloat(20.0)) {
        resetMiniPlayer(gesture)
      } else {
        showFullPlayer(gesture)
      }//if
    }//if state
  }//func
  
  func showFullPlayer(gesture: UIPanGestureRecognizer) {
    UIView.animateWithDuration(0.5) { () -> Void in
      let fuckingRealView = self.view.superview
        fuckingRealView?.backgroundColor = UIColor.redColor()
//      fuckingRealView?.frame.origin.y = self.topOfFrameYCoord
      
      self.view.backgroundColor = UIColor.yellowColor()
      self.view.frame.origin.y = self.topOfFrameYCoord
      self.tabBarController?.tabBar.alpha = 0
      self.topPlayerView?.alpha = 1
    }//animate
//    self.view.superview?.addGestureRecognizer(hidePlayerPanGestureRecognizer!)
    self.view.addGestureRecognizer(hidePlayerPanGestureRecognizer!)
    
//      self.view.addGestureRecognizer(hidePlayerPanGestureRecognizer!)

  }
  
  func resetMiniPlayer(gesture: UIPanGestureRecognizer) {
    print("resetting miniplayer")
    UIView.animateWithDuration(0.25) { () -> Void in
      self.view.frame.origin.y = 0
      self.tabBarController?.tabBar.alpha = 1.0
      self.topPlayerView?.alpha = 1.0
    }//animate

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}
