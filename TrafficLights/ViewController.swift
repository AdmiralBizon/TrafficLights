//
//  ViewController.swift
//  TrafficLights
//
//  Created by Ilya Klimenyuk on 22.10.2020.
//

import UIKit

enum CurrentLight {
   case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
       
        startButton.layer.cornerRadius = 10
        
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }

    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            currentLight = .yellow
            redLightView.alpha = lightIsOn
            greenLightView.alpha = lightIsOff
        case .yellow:
            currentLight = .green
            yellowLightView.alpha = lightIsOn
            redLightView.alpha = lightIsOff
        case .green :
            currentLight = .red
            greenLightView.alpha = lightIsOn
            yellowLightView.alpha = lightIsOff
        }
          
    }
        
}

