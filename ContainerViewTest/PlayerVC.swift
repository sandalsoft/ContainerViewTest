//
//  PlayerVC.swift
//  ContainerViewTest
//
//  Created by Eric Nelson on 8/16/15.
//  Copyright © 2015 Eric Nelson. All rights reserved.
//

import UIKit

let tabBarOffset: CGFloat = 5.0

<<<<<<< HEAD
class PlayerVC: UIViewController, UIGestureRecognizerDelegate {
  
  var topOfFrameYCoord: CGFloat = 0.0
  
  var hidePlayerPanGestureRecognizer: UIPanGestureRecognizer?
=======
class PlayerVC: UIViewController    {
  
  var topOfFrame: CGFloat = 0.0
  var containerViewTop: CGFloat = 0.0
>>>>>>> cleanedUp
  
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet weak var podcastImageView: UIImageView!
  
  var tapGesture: UITapGestureRecognizer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
<<<<<<< HEAD
    topOfFrameYCoord = -(self.view.frame.height - 65) // -671.0 on 6+
    hidePlayerPanGestureRecognizer?.delegate = self
    hidePlayerPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("hideFullPlayerGesture:"))
    
    self.view.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin
    
=======
    topOfFrame = -(self.view.frame.height - 65) // -671.0 on 6+
>>>>>>> cleanedUp
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
<<<<<<< HEAD
      if (translation.y > CGFloat(-100.0)) {
        resetMiniPlayer(gesture)
      } else {
        showFullPlayer(gesture)
      }//if
      
      gesture.setTranslation(CGPointMake(0, 0), inView:self.view)
    } else { //if state
      self.view.frame.origin.y = translation.y
    }
    
    
    
=======
      if (containerY < CGFloat(550.0)) {
        showFullPlayer()
      } else {
        resetMiniPlayer()
      }//if
    } else {
      self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
      gesture.setTranslation(CGPointZero, inView: self.view.superview)
    }//if state
>>>>>>> cleanedUp
  }//showplayergesture
  
  func hideFullPlayerGesture(gesture: UIPanGestureRecognizer) {

    //swipe down
    print("hidePlayerGesture")
    let point = gesture.locationInView(self.view)
    print("point: \(point)")
    let translation = gesture.translationInView(self.view)
    print("translation: \(translation)")
<<<<<<< HEAD

=======
    
    
>>>>>>> cleanedUp
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (translation.y > CGFloat(20.0)) {
        resetMiniPlayer(gesture)
      } else {
        showFullPlayer(gesture)
      }//if y> 20
    }//if state
  }//func
  
  func showFullPlayer(gesture: UIPanGestureRecognizer) {
    UIView.animateWithDuration(0.5) { () -> Void in
<<<<<<< HEAD
      let containerView = self.view.superview
      containerView?.backgroundColor = UIColor.redColor()
      
      self.view.backgroundColor = UIColor.yellowColor()
      
//      containerView?.frame.origin.y = self.topOfFrameYCoord
      self.view.frame.origin.y = self.topOfFrameYCoord
=======
      self.view.superview!.frame.origin.y = self.containerViewTop
      
>>>>>>> cleanedUp
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

      self.view.superview?.frame.origin.y = self.containerViewTop
      
      
      self.tabBarController?.tabBar.alpha = 1.0
      self.topPlayerView?.alpha = 1.0
    }//animate

  }
<<<<<<< HEAD

=======
  
  @IBAction func bottomGrayBoxHideGesture(gesture: UIPanGestureRecognizer) {
    print(gesture)
  }

  
>>>>>>> cleanedUp
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}
