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
    let translation = gesture.translationInView(self.view.superview!)
    
    print("containerY: \(containerY)   |    translationY \(translation.y)")
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (containerY < 550.0) {
        print("less than 550")
        showFullPlayer()
      } else {
        resetMiniPlayer()
      }//if
    } else {
      self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
      gesture.setTranslation(CGPointZero, inView: self.view.superview)
    }//if state
  }//showplayergesture
  
  
  func showFullPlayer() {
    print("showFullPlayer")
    UIView.animateWithDuration(0.5) { () -> Void in
      self.view.superview!.frame.origin.y = self.containerViewTop - self.view.frame.height
      
      self.podcastImageView.alpha = 1
      self.tabBarController?.tabBar.alpha = 0
      self.topPlayerView?.alpha = 0
    }//animate
  }
 
  
/*******************************************************/
/*******************************************************/
/*******************************************************/
  
  @IBAction func hidFullPlayerGesture(gesture: UIPanGestureRecognizer) {
    let containerY = self.view.superview!.frame.origin.y
    let translation = gesture.translationInView(self.view.superview!)
  
    print("containerY: \(containerY)   |    translationY \(translation.y)")
    if (gesture.state == UIGestureRecognizerState.Ended) {
      if (containerY > 150.0) {
        resetMiniPlayer()
      } else {
        showFullPlayer()
      }//if
    }//if state
    self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
    gesture.setTranslation(CGPointZero, inView: self.view.superview)
  }//func
  
  func resetMiniPlayer() {
    print("resetting miniplayer")
    UIView.animateWithDuration(0.25) { () -> Void in

      self.view.superview?.frame.origin.y = self.containerViewTop
      self.podcastImageView.alpha = 0.0
      self.tabBarController?.tabBar.alpha = 1.0
      self.topPlayerView?.alpha = 1.0
    }//animate

  }


  

}
