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
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet weak var podcastImageView: UIImageView!
  
  @IBOutlet weak var blurPodcastImage: UIImageView!
  var tapGesture: UITapGestureRecognizer?
  
  var containerViewOrigin: CGFloat = 0.0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    blurImageView(blurPodcastImage)

  }
  
  override func viewDidAppear(animated: Bool) {
    containerViewOrigin = (self.view.superview?.frame.origin.y)!
    print("containerViewOrigin: \(containerViewOrigin)")

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
      // finger is dragging views
      self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
      gesture.setTranslation(CGPointZero, inView: self.view.superview)
    }//if state
  }//showplayergesture
  
  
  func showFullPlayer() {
    print("showFullPlayer")
    UIView.animateWithDuration(0.5) { () -> Void in
      self.view.superview!.frame.origin.y = self.containerViewOrigin - self.view.frame.height
      
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
    
    // finger is dragging views
    self.view.superview!.frame.origin.y = self.view.superview!.frame.origin.y + translation.y
    gesture.setTranslation(CGPointZero, inView: self.view.superview)
  }//func
  
  func resetMiniPlayer() {
    print("resetting miniplayer")
    UIView.animateWithDuration(0.25) { () -> Void in

      self.view.superview?.frame.origin.y = self.containerViewOrigin
      self.podcastImageView.alpha = 0.0
      self.tabBarController?.tabBar.alpha = 1.0
      self.topPlayerView?.alpha = 1.0
    }//animate

  }


  func blurImageView(imageView: UIImageView) {
    if !UIAccessibilityIsReduceTransparencyEnabled() {
      imageView.backgroundColor = UIColor.clearColor()
      
      let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      //always fill the view
      blurEffectView.frame = imageView.bounds
      blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
      
      imageView.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
    }
    else {
      imageView.backgroundColor = UIColor.blackColor()
    }
  }
  

}
