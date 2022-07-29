//
//  ViewController.swift
//  Speedy Bottle
//
//  Created by Burak Altunoluk on 28/07/2022.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: Properties
    private var rotateOfBottle = 0.0
    private var randomNumber:Float = 0.001
    private var timer = Timer()
    @IBOutlet private var bottleImage: UIImageView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bottleImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureImageBottleTouched))
        bottleImage.addGestureRecognizer(gesture)
    }
    
    @objc func spinTheBottle() {
        rotateOfBottle += 0.1
        bottleImage.transform = bottleImage.transform.rotated(by: rotateOfBottle)
        if rotateOfBottle >= 14 { rotateOfBottle = 0.1 }
        if Int(rotateOfBottle) >= Int(randomNumber) {
            rotateOfBottle = 0.1
            timer.invalidate()
            bottleImage.isUserInteractionEnabled = true
        }
    }
    
    @objc func gestureImageBottleTouched() {
        randomNumber = Float.random(in: 7...14)
        timerIsOn()
    }
    
    func timerIsOn() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(spinTheBottle), userInfo: nil, repeats: true)
        bottleImage.isUserInteractionEnabled = false
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true }
}

