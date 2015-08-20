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
  
  var topOfFrame: CGFloat = 0.0
  
  @IBOutlet weak var topPlayerView: UIView!
  @IBOutlet var mainView: UIView!
  
  @IBOutlet weak var podcastImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    topOfFrame = -(self.view.frame.height - 65) // -671.0 on 6+
    self.mainView.userInteractionEnabled = true
    self.podcastImageView.userInteractionEnabled = true
    
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
self.view.clipsToBounds = true
//      self.view.frame.origin.y = self.topOfFrame

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

//  
//  
//  @IBAction func panUp(gesture: UIPanGestureRecognizer) {
//    let translation = gesture.translationInView(mainView)
//    
//    if (gesture.state == UIGestureRecognizerState.Ended) {
//      if (translation.y > CGFloat(-100.0)) {
//        resetMiniPlayer()
//      } else {
//        showFullPlayer()
//      }//if
//    }//if state

//    // if pan is more than 50 points, drag the frame
//    if (translation.y > CGFloat(-100.0)) {
//      self.view.frame.origin.y = translation.y
//    } else {
//      UIView.animateWithDuration(0.5) { () -> Void in
//        self.view.frame.origin.y = self.topOfFrame
//        self.tabBarController?.tabBar.alpha = 0
//        self.topPlayerView?.alpha = 0
//      }//animate
//    }// if translation
//  }//panVC

  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  

}
