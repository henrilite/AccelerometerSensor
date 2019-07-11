//
//  ViewController.swift
//  AccelerometerSensor
//
//  Created by Henri Lie Jaya on 11/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var xLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startGyroscope()
//        startAccelerometer()
    }
    
//    func startAccelerometer(){
//
//        //cek dlu
//
//        if motionManager.isAccelerometerAvailable{
//
//            motionManager.accelerometerUpdateInterval = 0.1
//
//            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
//                if let dataAccel = data{
//                    print(dataAccel)
//                    self.xLabel.text = String(format: "%.2f", dataAccel.acceleration.x)
//
//                    if ((dataAccel.acceleration.x > 0.1)) {
//                        self.colorView.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: CGFloat(dataAccel.acceleration.x))
//                    }
//                }
//            }
//        }
//    }
    
    
    
    func startGyroscope(){
        
        if motionManager.isGyroAvailable{
            motionManager.gyroUpdateInterval = 0.5
            
            motionManager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
                if let dataGyro = data{
                    print(dataGyro)
                    self.xLabel.textColor = .white
                    self.xLabel.text = "X: " + String(format: "%.2f", dataGyro.rotationRate.z)
                    
                    if ((dataGyro.rotationRate.z > 0)) {
                        self.view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                    } else {
                        self.view.backgroundColor = .black
                    }
                }
            }
        }
    }


}

